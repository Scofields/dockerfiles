#!/bin/sh
exec /usr/bin/java -jar /opt/jenkins.war >> /var/log/jenkins.log 2>&1
