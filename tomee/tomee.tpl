FROM rstiller/java:${name}

ADD http://archive.apache.org/dist/${path}/apache-tomee-${tomee}-plus.tar.gz /usr/share/apache-tomee-${tomee}.tar.gz
RUN cd /usr/share ; tar xfvz apache-tomee-${tomee}.tar.gz

CMD ['/usr/share/apache-tomee-*/bin/startup.sh']
