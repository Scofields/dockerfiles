FROM debian:${os}

RUN apt-get update
RUN apt-get install -y ${java}
ENV JAVA_HOME /usr/lib/jvm/${java_home}/
