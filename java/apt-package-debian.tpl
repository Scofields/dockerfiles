FROM debian:${os}

RUN apt-get update
RUN apt-get install -y --force-yes ${java}
ENV JAVA_HOME /usr/lib/jvm/${java_home}/
