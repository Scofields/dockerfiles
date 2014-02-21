FROM rstiller/java:ubuntu-12.04_openjdk_jdk-1.6

ADD http://eclipse.org/downloads/download.php?file=/jetty/8.1.14.v20131031/dist/jetty-distribution-8.1.14.v20131031.tar.gz&r=1 /usr/share/jetty.tar.gz
RUN cd /usr/share/ ; tar xfvz jetty.tar.gz

CMD ['/usr/share/jetty-d*/bin/jetty.sh', '-d', 'start']
