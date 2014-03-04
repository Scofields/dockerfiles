FROM ${repository}:${tag}
EXPOSE 5984

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ ${nickname} main restricted \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname} main restricted \n\
deb http://us.archive.ubuntu.com/ubuntu/ ${nickname}-updates main restricted \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname}-updates main restricted \n\
deb http://us.archive.ubuntu.com/ubuntu/ ${nickname} universe \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname} universe \n\
deb http://us.archive.ubuntu.com/ubuntu/ ${nickname}-updates universe \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname}-updates universe \n\
deb http://us.archive.ubuntu.com/ubuntu/ ${nickname} multiverse \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname} multiverse \n\
deb http://us.archive.ubuntu.com/ubuntu/ ${nickname}-updates multiverse \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname}-updates multiverse \n\
deb http://us.archive.ubuntu.com/ubuntu/ ${nickname}-backports main restricted universe multiverse \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ ${nickname}-backports main restricted universe multiverse \n\
deb http://security.ubuntu.com/ubuntu ${nickname}-security main restricted \n\
deb-src http://security.ubuntu.com/ubuntu ${nickname}-security main restricted \n\
deb http://security.ubuntu.com/ubuntu ${nickname}-security universe \n\
deb-src http://security.ubuntu.com/ubuntu ${nickname}-security universe \n\
deb http://security.ubuntu.com/ubuntu ${nickname}-security multiverse \n\
deb-src http://security.ubuntu.com/ubuntu ${nickname}-security multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y g++ erlang-dev erlang-manpages erlang-base-hipe erlang-eunit erlang-nox erlang-xmerl erlang-inets libmozjs185-dev libicu-dev libcurl4-gnutls-dev libtool wget make python-simplejson
ADD http://archive.apache.org/dist/couchdb/source/${couchdb}/apache-couchdb-${couchdb}.tar.gz /tmp/apache-couchdb-${couchdb}.tar.gz
RUN cd /tmp && tar xvzf apache-couchdb-${couchdb}.tar.gz
RUN cd /tmp/apache-couchdb-* && ./configure && make && make install
RUN ln -s /usr/local/etc/logrotate.d/couchdb /etc/logrotate.d/couchdb
RUN ln -s /usr/local/etc/init.d/couchdb /etc/init.d
RUN update-rc.d couchdb defaults

RUN echo "[httpd]\n\
bind_address = 0.0.0.0\n\
port = 5984" > /usr/local/etc/couchdb/local.ini

ENV ERL_MAX_PORTS 4096
ENV ERL_FLAGS "+A 4"

CMD ["/usr/local/bin/couchdb"]
