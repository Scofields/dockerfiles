FROM rstiller/java:${os}_${java}

ADD virgo-${server}-full-${virgo}.RELEASE.tar.gz /usr/share/

CMD ['/usr/share/virgo-${server}-full-${virgo}.RELEASE/bin/start.sh']
