FROM tianon/debian:7.2
EXPOSE 5984

RUN echo "\ndeb http://packages.erlang-solutions.com/debian wheezy contrib\n" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y --force-yes wget make erlang build-essential libtool autoconf automake autoconf-archive pkg-config libmozjs185-dev libicu-dev python-simplejson
ADD http://www.eu.apache.org/dist/couchdb/source/1.5.0/apache-couchdb-1.5.0.tar.gz /tmp/apache-couchdb-1.5.0.tar.gz
RUN cd /tmp && tar xvzf apache-couchdb-1.5.0.tar.gz
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
