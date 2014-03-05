FROM rstiller/java:${name}

RUN apt-get -q update
RUN apt-get install -y wget openssl unzip build-essential make
ADD http://www.caucho.com/download/resin-${resin}-src.zip /tmp/resin-src.zip
RUN unzip /tmp/resin-src.zip -d /usr/src
RUN cd /usr/src/resin* ; chmod +x configure
RUN cd /usr/src/resin* ; ./configure --prefix=/usr/local/share/resin --with-resin-root=/var/resin --with-resin-log=/var/log/resin --with-resin-conf=/etc/resin
RUN cd /usr/src/resin* ; make && make install
