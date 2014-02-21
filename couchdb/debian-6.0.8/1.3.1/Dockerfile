FROM tianon/debian:6.0.8
EXPOSE 5984

RUN apt-get update
RUN apt-get install -y --force-yes wget procps default-jre-headless libwxbase2.8-0 libwxgtk2.8-0 build-essential libtool autoconf automake autoconf-archive pkg-config libssl0.9.8 libssl-dev zlib1g zlib1g-dev libcurl4-openssl-dev lsb-base ncurses-dev libncurses-dev libmozjs-dev libmozjs2d libicu-dev xsltproc make python-simplejson
ADD http://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_15.b.3-1~debian~squeeze_amd64.deb /tmp/erlang.deb
RUN cd /tmp && dpkg --force-depends -i erlang.deb
RUN apt-get -f install
ADD http://archive.apache.org/dist/couchdb/source/1.3.1/apache-couchdb-1.3.1.tar.gz /tmp/apache-couchdb-1.3.1.tar.gz
RUN cd /tmp && tar xvzf apache-couchdb-1.3.1.tar.gz
RUN cd /tmp/apache-couchdb-* && ./configure --prefix=/usr/local --with-js-lib=/usr/lib --with-js-include=/usr/include/mozjs --enable-init && make && make install
RUN useradd -d /var/lib/couchdb couchdb
RUN chown -R couchdb:couchdb /usr/local/lib/couchdb /usr/local/etc/couchdb /usr/local/var/lib/couchdb /usr/local/var/log/couchdb /usr/local/var/run/couchdb
RUN chmod -R g+rw /usr/local/lib/couchdb /usr/local/etc/couchdb /usr/local/var/lib/couchdb /usr/local/var/log/couchdb /usr/local/var/run/couchdb
RUN ln -s /usr/local/etc/logrotate.d/couchdb /etc/logrotate.d/couchdb
RUN ln -s /usr/local/etc/init.d/couchdb /etc/init.d
RUN update-rc.d couchdb defaults

RUN echo "[httpd]\n\
bind_address = 0.0.0.0\n\
port = 5984" > /usr/local/etc/couchdb/local.ini

ENV ERL_MAX_PORTS 4096
ENV ERL_FLAGS "+A 4"

CMD ["/usr/local/bin/couchdb"]
