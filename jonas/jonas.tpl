FROM rstiller/java:${os}_${java}

ADD jonas-full-${jonas}-bin.tar.gz /usr/share/

CMD ['/usr/share/jonas-full-${jonas}/bin/jonas', 'start']
