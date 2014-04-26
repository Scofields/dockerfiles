FROM rstiller/java:${name}

ADD jetty-distribution-${version}.tar.gz /usr/share/

CMD ['/usr/share/jetty-distribution-${version}/bin/jetty.sh', '-d', 'start']
