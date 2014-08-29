FROM rstiller/java:${os}_${java}

RUN apt-get update -qq && apt-get install -y --force-yes --no-install-recommends unzip
ADD virgo-${server}-full-${virgo}.RELEASE.zip /usr/share/
RUN cd /usr/share/; unzip virgo-${server}-full-${virgo}.RELEASE.zip && rm virgo-${server}-full-${virgo}.RELEASE.zip

CMD ['/usr/share/virgo-${server}-full-${virgo}.RELEASE/bin/start.sh']
