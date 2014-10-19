FROM rstiller/couchdb:${name}_couchdb-${couchdb}

ENV COUCH_SRC /tmp/apache-couchdb-${couchdb}/src/couchdb/
RUN apt-get update -q
RUN apt-get install -y --force-yes git
RUN git clone https://github.com/couchbase/geocouch.git /geocouch
RUN cd /geocouch ; git checkout couchdb1.3.x
RUN cd /geocouch ; make
ENV ERL_FLAGS="+A 4 -pa /geocouch/ebin"
