FROM rstiller/java:${name}

ADD eclipse-orion-${orion}-linux.gtk.x86_64.zip /eclipse-orion-${orion}/

EXPOSE 8080

CMD ['eclipse-orion-${orion}/eclipse/orion']
