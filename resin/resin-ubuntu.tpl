FROM rstiller/java:${name}

ADD http://www.caucho.com/download/debian/dists/precise/multiverse/binary-amd64/resin_${resin}-amd64.deb /tmp/resin.deb
RUN cd /tmp ; dpkg -i resin.deb
RUN apt-get install -y
