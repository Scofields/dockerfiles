FROM rstiller/java:${name}

ADD eclipse-orion-${orion}-linux.gtk.x86_64.zip /

EXPOSE 8080

CMD ['eclipse/orion']
