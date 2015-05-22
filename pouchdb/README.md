# pouchdb-server

AN image based on iojs:slim with pouchdb server and leveldown database.

RUN:

`docker run -d -v /data/pouchdb/:/pouchdb --hostname="pouchdb-server" --name="pouchdb-server" -p 0.0.0.0:5984:5984 rstiller/pouchdb-server`