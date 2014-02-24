#!/bin/sh

docker build --rm -t rstiller/tomcat:debian-6.0.7_oracle-jdk-1.7_tomcat-6.0.37 - < debian-6.0.7_oracle-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_oracle-jdk-1.7_tomcat-6.0.39 - < debian-6.0.7_oracle-jdk-1.7_tomcat-6.0.39 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_oracle-jdk-1.7_tomcat-7.0.47 - < debian-6.0.7_oracle-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_oracle-jdk-1.7_tomcat-7.0.50 - < debian-6.0.7_oracle-jdk-1.7_tomcat-7.0.50 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_oracle-jdk-1.7_tomcat-7.0.52 - < debian-6.0.7_oracle-jdk-1.7_tomcat-7.0.52 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_oracle-jdk-1.7_tomcat-8.0.1 - < debian-6.0.7_oracle-jdk-1.7_tomcat-8.0.1 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_oracle-jdk-1.7_tomcat-latest - < debian-6.0.7_oracle-jdk-1.7_tomcat-8.0.1 && \
 \
docker build --rm -t rstiller/tomcat:debian-6.0.7_openjdk-jdk-1.6_tomcat-6.0.37 - < debian-6.0.7_openjdk-jdk-1.6_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_openjdk-jdk-1.6_tomcat-6.0.39 - < debian-6.0.7_openjdk-jdk-1.6_tomcat-6.0.39 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_openjdk-jdk-1.6_tomcat-7.0.47 - < debian-6.0.7_openjdk-jdk-1.6_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_openjdk-jdk-1.6_tomcat-7.0.50 - < debian-6.0.7_openjdk-jdk-1.6_tomcat-7.0.50 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_openjdk-jdk-1.6_tomcat-7.0.52 - < debian-6.0.7_openjdk-jdk-1.6_tomcat-7.0.52 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_openjdk-jdk-1.6_tomcat-latest - < debian-6.0.7_openjdk-jdk-1.6_tomcat-7.0.52