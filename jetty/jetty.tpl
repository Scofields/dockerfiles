FROM rstiller/java:${name}

ADD http://eclipse.org/downloads/download.php?file=/jetty/${version}/dist/jetty-distribution-${version}.tar.gz&r=1 /usr/share/jetty.tar.gz
RUN cd /usr/share/ ; tar xfvz jetty.tar.gz

CMD ['/usr/share/jetty-d*/bin/jetty.sh', '-d', 'start']
