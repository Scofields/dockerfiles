FROM tianon/debian:7.2

RUN echo "\n\ndeb http://caucho.com/download/debian/ unstable universe\ndeb http://caucho.com/download/debian/ unstable multiverse " >> /etc/apt/sources.list
RUN apt-get -q update
RUN apt-get install -y --force-yes resin
