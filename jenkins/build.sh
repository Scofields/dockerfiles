#!/bin/sh

if [ ! -f ./jenkins.war ]; then
    wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
fi

docker build --rm --force-rm=true --tag=rstiller/jenkins .
