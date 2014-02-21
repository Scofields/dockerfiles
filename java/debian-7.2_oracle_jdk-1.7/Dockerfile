FROM tianon/debian:7.2

ADD jdk-7u45-linux-x64.tar.gz /usr/share/jdk.tar.gz
RUN cd /usr/share ; tar -zxvf jdk.tar.gz
RUN ln -s /usr/share/jdk*/bin/* /usr/bin/
ENV JAVA_HOME /usr/share/jdk1.7.0_45/
