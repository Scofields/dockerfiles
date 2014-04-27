FROM rstiller/java:${os}_${java}

ADD vert.x-${vertx}-final.tar.gz /usr/share/
RUN ln -s /usr/share/vert.x-${vertx}-final/bin/vertx /usr/bin/vertx

CMD ['/usr/share/vert.x-${vertx}-final/bin/vertx']
