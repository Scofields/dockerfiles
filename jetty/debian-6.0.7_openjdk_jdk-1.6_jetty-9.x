FROM rstiller/java:debian-6.0.7_openjdk_jdk-1.6

ADD http://eclipse.org/downloads/download.php?file=/jetty/9.1.0.v20131115/dist/jetty-distribution-9.1.0.v20131115.tar.gz&r=1 /usr/share/jetty.tar.gz
RUN cd /usr/share/ ; tar xfvz jetty.tar.gz

CMD ['/usr/share/jetty-d*/bin/jetty.sh', '-d', 'start']
