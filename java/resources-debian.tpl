FROM debian:${os}

ADD resources/${java_flavour}-${java_version}-linux-x64.tar.gz /java.tar.gz
RUN mkdir -p /usr/share/java/
RUN tar -zxf /java.tar.gz -C /usr/share/java/
RUN ln -s /usr/share/java/${java_flavour}${java_path}/bin/* /usr/bin/
ENV JAVA_HOME /usr/share/java/${java_flavour}${java_path}
