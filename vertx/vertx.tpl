FROM rstiller/java:${os}_${java}

RUN apt-get -q update
RUN apt-get install -y wget
RUN wget --output-document=/usr/share/vertx.tar.gz http://dl.bintray.com/vertx/downloads/vert.x-${vertx}-final.tar.gz
RUN cd /usr/share ; tar xfvz vertx.tar.gz
RUN ln -s /usr/share/vert.x-*/bin/vertx /usr/bin/vertx

CMD ['/usr/share/vert.x-*/bin/vertx']
