FROM rstiller/java:${os}_${java}

ADD http://dl.bintray.com/vertx/downloads/vert.x-${vertx}-final.tar.gz /usr/share/vertx.tar.gz
RUN cd /usr/share ; tar xfvz vertx.tar.gz
RUN ln -s /usr/share/vert.x-*/bin/vertx /usr/bin/vertx

CMD ['/usr/share/vert.x-*/bin/vertx']
