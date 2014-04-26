FROM ubuntu:${os}

RUN echo "deb http://archive.ubuntu.com/ubuntu/ ${nickname} main restricted
deb-src http://archive.ubuntu.com/ubuntu/ ${nickname} main restricted
deb http://archive.ubuntu.com/ubuntu/ ${nickname}-updates main restricted
deb-src http://archive.ubuntu.com/ubuntu/ ${nickname}-updates main restricted
deb http://archive.ubuntu.com/ubuntu/ ${nickname} universe
deb-src http://archive.ubuntu.com/ubuntu/ ${nickname} universe
deb http://archive.ubuntu.com/ubuntu/ ${nickname}-updates universe
deb-src http://archive.ubuntu.com/ubuntu/ ${nickname}-updates universe
deb http://archive.ubuntu.com/ubuntu/ ${nickname}-security main restricted
deb-src http://archive.ubuntu.com/ubuntu/ ${nickname}-security main restricted
deb http://archive.ubuntu.com/ubuntu/ ${nickname}-security universe
deb-src http://archive.ubuntu.com/ubuntu/ ${nickname}-security universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y --force-yes ${java}
ENV JAVA_HOME /usr/lib/jvm/${java_home}/

