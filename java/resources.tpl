FROM ${os_family}:${os_version}

ADD ${java_flavour}-${java_version}-linux-x64.tar.gz /usr/share/java/
RUN ln -sf /usr/share/java/${java_flavour}${java_path}/bin/* /usr/bin/
ENV JAVA_HOME /usr/share/java/${java_flavour}${java_path}
