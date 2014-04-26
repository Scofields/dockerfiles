FROM rstiller/java:${name}

RUN apt-get -q update
RUN apt-get install -y wget openssl unzip build-essential make
ADD resin-${resin}.tar.gz /usr/src/
RUN cd /usr/src/resin-${resin} ; chmod +x configure
RUN cd /usr/src/resin-${resin} ; ./configure --prefix=/usr/local/share/resin --with-resin-root=/var/resin --with-resin-log=/var/log/resin --with-resin-conf=/etc/resin
RUN cd /usr/src/resin-${resin} ; make && make install
