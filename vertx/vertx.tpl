FROM rstiller/java:${os}_${java}

ADD vert.x-${vertx}-final.tar.gz /usr/share/vertx-${vertx}.tar.gz
RUN ln -s /usr/share/vertx-${vertx}.tar.gz/vert.x-${vertx}-final/bin/vertx /usr/bin/vertx

CMD ['/usr/share/vertx-${vertx}.tar.gz/vert.x-${vertx}-final/bin/vertx']
