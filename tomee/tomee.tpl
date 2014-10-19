FROM rstiller/java:${name}

ADD apache-tomee-${tomee}-plus.tar.gz /usr/share/

CMD ['/usr/share/apache-tomee-plus-${tomee}/bin/startup.sh']
