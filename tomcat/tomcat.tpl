FROM rstiller/java:${name}

ADD http://archive.apache.org/dist/tomcat/tomcat-${family}/v${tomcat}/bin/apache-tomcat-${tomcat}.tar.gz /usr/share/apache-tomcat.tar.gz
RUN cd /usr/share ; tar xfvz apache-tomcat.tar.gz

CMD ['/usr/share/apache-tomcat-*/bin/startup.sh']
