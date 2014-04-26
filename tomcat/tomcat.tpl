FROM rstiller/java:${name}

ADD apache-tomcat-${tomcat}.tar.gz /usr/share/

CMD ['/usr/share/apache-tomcat-${tomcat}/bin/startup.sh']
