FROM ubuntu:${os}

RUN echo "deb http://archive.ubuntu.com/ubuntu/ ${nickname} main restricted \n \
deb-src http://archive.ubuntu.com/ubuntu/ ${nickname} main restricted \n \
deb http://archive.ubuntu.com/ubuntu/ ${nickname}-updates main restricted \n \
deb-src http://archive.ubuntu.com/ubuntu/ ${nickname}-updates main restricted \n \
deb http://archive.ubuntu.com/ubuntu/ ${nickname} universe \n \
deb-src http://archive.ubuntu.com/ubuntu/ ${nickname} universe \n \
deb http://archive.ubuntu.com/ubuntu/ ${nickname}-updates universe \n \
deb-src http://archive.ubuntu.com/ubuntu/ ${nickname}-updates universe \n \
deb http://archive.ubuntu.com/ubuntu/ ${nickname}-security main restricted \n \
deb-src http://archive.ubuntu.com/ubuntu/ ${nickname}-security main restricted \n \
deb http://archive.ubuntu.com/ubuntu/ ${nickname}-security universe \n \
deb-src http://archive.ubuntu.com/ubuntu/ ${nickname}-security universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y --force-yes --no-install-recommends ${java}
ENV JAVA_HOME /usr/lib/jvm/${java_home}/

