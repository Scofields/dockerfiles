FROM rstiller/java:${os}_${java}

ADD virgo-${server}-server-${virgo}.RELEASE.tar.gz /usr/share/

CMD ['/usr/share/virgo-${server}-server-${virgo}.RELEASE/bin/start.sh']
