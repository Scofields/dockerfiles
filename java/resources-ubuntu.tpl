FROM ubuntu:${os}

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ ${nickname} main restricted \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname} main restricted \n\
deb http://us.archive.ubuntu.com/ubuntu/ ${nickname}-updates main restricted \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname}-updates main restricted \n\
deb http://us.archive.ubuntu.com/ubuntu/ ${nickname} universe \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname} universe \n\
deb http://us.archive.ubuntu.com/ubuntu/ ${nickname}-updates universe \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname}-updates universe \n\
deb http://us.archive.ubuntu.com/ubuntu/ ${nickname} multiverse \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname} multiverse \n\
deb http://us.archive.ubuntu.com/ubuntu/ ${nickname}-updates multiverse \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname}-updates multiverse \n\
deb http://us.archive.ubuntu.com/ubuntu/ ${nickname}-backports main restricted universe multiverse \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname}-backports main restricted universe multiverse \n\
deb http://security.ubuntu.com/ubuntu ${nickname}-security main restricted \n\
deb-src http://security.ubuntu.com/ubuntu ${nickname}-security main restricted \n\
deb http://security.ubuntu.com/ubuntu ${nickname}-security universe \n\
deb-src http://security.ubuntu.com/ubuntu ${nickname}-security universe \n\
deb http://security.ubuntu.com/ubuntu ${nickname}-security multiverse \n\
deb-src http://security.ubuntu.com/ubuntu ${nickname}-security multiverse" > /etc/apt/sources.list
RUN apt-get update
ADD resources/${java_flavour}-${java_version}-linux-x64.tar.gz /java.tar.gz
RUN mkdir -p /usr/share/java/
RUN tar -zxf /java.tar.gz -C /usr/share/java/
RUN ln -s /usr/share/java/${java_flavour}${java_path}/bin/* /usr/bin/
ENV JAVA_HOME /usr/share/java/${java_flavour}${java_path}
