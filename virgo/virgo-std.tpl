FROM rstiller/java:${os}_${java}

RUN apt-get update -qq && apt-get install -y --force-yes --no-install-recommends unzip
ADD virgo-${server}-server-${virgo}.RELEASE.zip /usr/share/
RUN cd /usr/share/; unzip virgo-${server}-server-${virgo}.RELEASE.zip && rm virgo-${server}-server-${virgo}.RELEASE.zip

CMD ['/usr/share/virgo-${server}-server-${virgo}.RELEASE/bin/start.sh']
