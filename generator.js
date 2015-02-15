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
var push       = !!process.argv[4] && process.argv[4] === '--push';
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

var writeDockerfile = function(directory, templateFile, nameTemplate, values, resourceNamePattern) {
    var version = nameTemplate;
    var content = fs.readFileSync(templateFile, 'utf8');
    var resourceRegExp = resourceNamePattern;
    
    for(var i = 0; i < values.length; i++) {
        for(var placeholder in values[i]) {
            if(!!resourceRegExp) {
                resourceRegExp = resourceRegExp.replace(new RegExp('\\$\\{' + placeholder + '\\}', 'g'), values[i][placeholder]);
            }
            version = version.replace(new RegExp('\\$\\{' + placeholder + '\\}', 'g'), values[i][placeholder]);
            content = content.replace(new RegExp('\\$\\{' + placeholder + '\\}', 'g'), values[i][placeholder]);
        }
    }
    if(!!resourceRegExp) {
        resourceRegExp = new RegExp(resourceRegExp, 'g');
    }
    
    var targetDir = path.join(homeDir, directory, 'tmp');
    targetFile = path.join(targetDir, version);
    if(!fs.existsSync(targetDir)) {
        fs.mkdirSync(targetDir);
    }
    fs.writeFileSync(targetFile, content);
};

var getBuildCommand = function(directory, repository, nameTemplate, values) {
    var version = nameTemplate;
    var tag = repository + ':';
    
    for(var i = 0; i < values.length; i++) {
        for(var placeholder in values[i]) {
            version = version.replace(new RegExp('\\$\\{' + placeholder + '\\}', 'g'), values[i][placeholder]);
        }
    }
    
    tag += version;
    
    var targetDir = path.join(homeDir, directory, 'tmp');
    var logFile = path.join(homeDir, directory, 'tmp', version + '.log');
    
    return {
        dir: targetDir,
        log: logFile,
        cmd: ['docker', ['build', '--force-rm=true', '--rm', '-t', tag, '-f', path.join(targetDir, version), '.'], {
            cwd: targetDir
        }],
        tag: tag
    };
};

var getPushCommand = function(directory, repository, nameTemplate, values) {
    var version = nameTemplate;
    var tag = repository + ':';
    
    for(var i = 0; i < values.length; i++) {
        for(var placeholder in values[i]) {
            version = version.replace(new RegExp('\\$\\{' + placeholder + '\\}', 'g'), values[i][placeholder]);
        }
    }
    
    tag += version;
    
    var targetDir = path.join(homeDir, directory, 'tmp');
    var logFile = path.join(homeDir, directory, 'tmp', version + '.log');
    
    return {
        dir: targetDir,
        log: logFile,
        cmd: ['docker', ['push', tag]],
        tag: tag,
        type: 'push'
    };
};

var getDownloadCommand = function(directory, nameTemplate, values, filename, url) {
    var downloadFolder = path.resolve(path.join(homeDir, directory, 'tmp'));
    
    if(!fs.existsSync(path.resolve(downloadFolder))) {
        fs.mkdirSync(path.resolve(downloadFolder));
    }
    
    var downloadFile = path.join(downloadFolder, filename);
    var version = nameTemplate;
    
    for(var i = 0; i < values.length; i++) {
        for(var placeholder in values[i]) {
            version = version.replace(new RegExp('\\$\\{' + placeholder + '\\}', 'g'), values[i][placeholder]);
        }
    }
    
    var logFile = path.join(homeDir, directory, 'tmp', version + '.log');
    
    return {
        dir: downloadFolder,
        log: logFile,
        cmd: ['/usr/bin/wget', ['--output-document=' + downloadFile, url]],
        type: 'download',
        url: url,
        file: downloadFile
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
        if(!fs.existsSync(path.resolve(homeDir))) {
            fs.mkdirSync(path.resolve(homeDir));
        }
        if(!fs.existsSync(path.resolve(path.join(homeDir, repository)))) {
            fs.mkdirSync(path.resolve(path.join(homeDir, repository)));
        }
        if(!!config.resources) {
            for(var filename in config.resources) {
                buildCommands.push(getDownloadCommand(repository, config.name, values, filename, config.resources[filename]));
            }
        }
        
        writeDockerfile(repository, template, config.name, values, config.resourceNamePattern);
        
        if(build) {
            buildCommands.push(getBuildCommand(repository, config.repository, config.name, values));
            if(push) {
                buildCommands.push(getPushCommand(repository, config.repository, config.name, values));
            }
        }
    }
}

var commandIndex = 0;
var executeNextBuild = function() {
    var command = buildCommands[commandIndex++];
    if(!fs.existsSync(command.dir)) {
        fs.mkdirSync(command.dir);
    }
    
    if(!!command.type && command.type === 'download') {
        if(fs.existsSync(command.file)) {
            if(commandIndex < buildCommands.length) {
                executeNextBuild();
            }
            return;
        }
    }
    
    var logFileStream = fs.createWriteStream(command.log);
    var process = spawn.apply(null, command.cmd);
    
    process.stdout.pipe(logFileStream);
    process.stderr.pipe(logFileStream);
    process.on('exit', function (code) {
        if(!!command.type && command.type === 'push') {
            console.log(command.tag + (code === 0 ? ' pushed' : ' not pushed'));
        } else if(!!command.type && command.type === 'download') {
            console.log(command.url + (code === 0 ? ' downloaded' : ' not downloaded'));
        } else {
            console.log(command.tag + (code === 0 ? ' built' : ' not built'));
        }
        if(commandIndex < buildCommands.length) {
            executeNextBuild();
        }
    });
};

if(build && buildCommands.length > 0) {
    executeNextBuild();
}
