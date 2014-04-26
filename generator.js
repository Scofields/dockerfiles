#!/usr/bin/node

/*
 * http://nodejs.org/docs/v0.6.0/api/
 */

var fs = require('fs');
var path = require('path');
var spawn = require('child_process').spawn;

var configs    = JSON.parse(fs.readFileSync(process.argv[2], 'utf8'));
var repository = path.dirname(process.argv[2]);
var build      = !!process.argv[3] && process.argv[3] === '--build';
var homeDir    = path.join(process.env[(process.platform == 'win32') ? 'USERPROFILE' : 'HOME'], 'shared');

function Variable(values) {
    
    this.values = values;
    this.length = values.length;
    
    var slf = this;
    
    this.get = function(index) {
        return slf.values[index];
    };
    
}

function Iterator(variables) {
    
    this.variables = variables;
    this.indicies = [new Array(variables.length)];
    this.currentIndex = 0;
    
    var slf = this;
    var copyArray = function(array) {
        var tmp = new Array(array.length);
        
        for(var i = 0; i < array.length; i++) {
            if(array[i] instanceof Array) {
                tmp[i] = copyArray(array[i]);
            } else {
                tmp[i] = array[i];
            }
        }
        
        return tmp;
    };
    
    for(var i = slf.variables.length - 1; i >= 0; i--) {
        var variable = slf.variables[i];
        var indexCount = slf.indicies.length;
        var newIndicies = slf.indicies.concat();
        
        for(var c = 1; c < variable.length; c++) {
            newIndicies = newIndicies.concat(copyArray(slf.indicies));
        }
        
        for(var d = 0; d < variable.length; d++) {
            for(var n = 0; n < indexCount; n++) {
                newIndicies[d * indexCount +  n][i] = d;
            }
        }
        
        slf.indicies = newIndicies;
    }
    
    this.hasNext = function() {
        return slf.currentIndex < slf.indicies.length;
    };
    
    this.next = function() {
        var values = [];
        
        for(var i = 0; i < slf.variables.length; i++) {
            values[i] = slf.variables[i].get(slf.indicies[slf.currentIndex][i]);
        }
        slf.currentIndex++;
        
        return values;
    };
    
}

var writeFile = function(directory, templateFile, nameTemplate, values, copyResources, resourceNamePattern) {
    var targetDir = nameTemplate;
    var content = fs.readFileSync(templateFile, 'utf8');
    var resourceRegExp = resourceNamePattern;
    
    for(var i = 0; i < values.length; i++) {
        for(var placeholder in values[i]) {
            targetDir = targetDir.replace(new RegExp('\\$\\{' + placeholder + '\\}', 'g'), values[i][placeholder]);
            resourceRegExp = resourceRegExp.replace(new RegExp('\\$\\{' + placeholder + '\\}', 'g'), values[i][placeholder]);
            content = content.replace(new RegExp('\\$\\{' + placeholder + '\\}', 'g'), values[i][placeholder]);
        }
    }
    resourceRegExp = new RegExp(resourceRegExp, 'g');
    
    targetDir = path.join(homeDir, directory, targetDir);
    targetFile = path.join(targetDir, 'Dockerfile');
    if(!fs.existsSync(targetDir)) {
        fs.mkdirSync(targetDir);
    }
    fs.writeFileSync(targetFile, content);
    
    if(fs.existsSync(path.join(directory, 'resources')) && copyResources === true) {
        var files = fs.readdirSync(path.resolve(path.join(directory, 'resources')));
        for(var i = 0; i < files.length; i++) {
            if(resourceRegExp.test(files[i]) && !fs.existsSync(path.resolve(path.join(targetDir, files[i])))) {
                spawn('cp', [path.resolve(path.join(directory, 'resources', files[i])), path.resolve(targetDir) + '/']);
            }
        }
    }
};

var getBuildCommand = function(directory, repository, nameTemplate, values) {
    var targetDir = nameTemplate;
    var tag = repository + ':';
    
    for(var i = 0; i < values.length; i++) {
        for(var placeholder in values[i]) {
            targetDir = targetDir.replace(new RegExp('\\$\\{' + placeholder + '\\}', 'g'), values[i][placeholder]);
        }
    }
    
    tag += targetDir;
    
    targetDir = path.join(homeDir, directory, targetDir);
    logFile = targetDir + '.log';
    
    return {
        dir: targetDir,
        log: logFile,
        cmd: ['docker', ['build', '--rm', '-t', tag, '.'], {
            cwd: targetDir
        }],
        tag: tag
    };
};

var buildCommands = [];
for(var i = 0; i < configs.length; i++) {
    var config = configs[i];
    var variables = [];
    var template = path.join(repository, config.template);
    for(var variableIndex in config.variables) {
        variables.push(new Variable(config.variables[variableIndex]));
    }

    var iterator = new Iterator(variables);
    while(iterator.hasNext()) {
        var values = iterator.next();
        if(!fs.existsSync(path.resolve(path.join(homeDir, repository)))) {
            fs.mkdirSync(path.resolve(path.join(homeDir, repository)));
        }
        writeFile(repository, template, config.name, values, config.resources, config.resourceNamePattern);
        if(build) {
            buildCommands.push(getBuildCommand(repository, config.repository, config.name, values));
        }
    }
}

var commandIndex = 0;
var executeNextBuild = function() {
    var command = buildCommands[commandIndex++];
    if(!fs.existsSync(command.dir)) {
        fs.mkdirSync(command.dir);
    }
    
    var logFileStream = fs.createWriteStream(command.log);
    var process = spawn.apply(null, command.cmd);
    
    process.stdout.pipe(logFileStream);
    process.stderr.pipe(logFileStream);
    process.on('exit', function (code) {
        console.log(command.tag + (code === 0 ? ' built' : ' not built'));
        if(commandIndex < buildCommands.length) {
            executeNextBuild();
        }
    });
};

if(build && buildCommands.length > 0) {
    executeNextBuild();
}
