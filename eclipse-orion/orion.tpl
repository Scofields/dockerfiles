FROM rstiller/java:${name}

EXPOSE 8080

RUN apt-get update
RUN apt-get install -y unzip wget
RUN wget --no-cookie --output-document=orion.zip http://download.eclipse.org/orion/drops/${version}/eclipse-orion-${orion}-linux.gtk.x86_64.zip
RUN unzip /orion.zip -d /

CMD ['eclipse/orion']
