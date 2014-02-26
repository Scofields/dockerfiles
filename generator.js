#!/usr/bin/node

/*
 * http://nodejs.org/docs/v0.6.0/api/
 */

var fs = require('fs');
var path = require('path');

var config = JSON.parse(fs.readFileSync(process.argv[2], 'utf8'));
var repository = path.dirname(process.argv[2]);
var template = path.join(repository, config.template);

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

var writeFile = function(directory, templateFile, nameTemplate, values) {
    var targetDir = nameTemplate;
    var content = fs.readFileSync(templateFile, 'utf8');
    
    for(var i = 0; i < values.length; i++) {
        
        for(var placeholder in values[i]) {
            targetDir = targetDir.replace(new RegExp('\\$\\{' + i + '\\}', 'g'), values[i][placeholder]);
            content = content.replace(new RegExp('\\$\\{' + placeholder + '\\}', 'g'), values[i][placeholder]);
        }
    }
    
    targetDir = path.join(directory, targetDir);
    targetFile = path.join(targetDir, 'Dockerfile');
    if(!path.existsSync(targetDir)) {
        fs.mkdirSync(targetDir);
    }
    fs.writeFileSync(targetFile, content);
};

var variables = [];
for(var variableIndex in config.variables) {
    variables.push(new Variable(config.variables[variableIndex]));
}

var iterator = new Iterator(variables);
while(iterator.hasNext()) {
    writeFile(repository, template, config.name, iterator.next());
}
