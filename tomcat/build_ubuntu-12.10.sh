#!/bin/sh

docker build --rm -t rstiller/tomcat:ubuntu-12.10_oracle-jdk-1.7_tomcat-6.0.37 - < ubuntu-12.10_oracle-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_oracle-jdk-1.7_tomcat-6.0.39 - < ubuntu-12.10_oracle-jdk-1.7_tomcat-6.0.39 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_oracle-jdk-1.7_tomcat-7.0.47 - < ubuntu-12.10_oracle-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_oracle-jdk-1.7_tomcat-7.0.50 - < ubuntu-12.10_oracle-jdk-1.7_tomcat-7.0.50 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_oracle-jdk-1.7_tomcat-8.0.1 - < ubuntu-12.10_oracle-jdk-1.7_tomcat-8.0.1 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_oracle-jdk-1.7_tomcat-latest - < ubuntu-12.10_oracle-jdk-1.7_tomcat-8.0.1 && \
 \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.7_tomcat-6.0.37 - < ubuntu-12.10_openjdk-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.7_tomcat-6.0.39 - < ubuntu-12.10_openjdk-jdk-1.7_tomcat-6.0.39 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.7_tomcat-7.0.47 - < ubuntu-12.10_openjdk-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.7_tomcat-7.0.50 - < ubuntu-12.10_openjdk-jdk-1.7_tomcat-7.0.50 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.7_tomcat-8.0.1 - < ubuntu-12.10_openjdk-jdk-1.7_tomcat-8.0.1 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.7_tomcat-latest - < ubuntu-12.10_openjdk-jdk-1.7_tomcat-8.0.1 && \
 \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.6_tomcat-6.0.37 - < ubuntu-12.10_openjdk-jdk-1.6_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.6_tomcat-6.0.39 - < ubuntu-12.10_openjdk-jdk-1.6_tomcat-6.0.39 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.6_tomcat-7.0.47 - < ubuntu-12.10_openjdk-jdk-1.6_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.6_tomcat-7.0.50 - < ubuntu-12.10_openjdk-jdk-1.6_tomcat-7.0.50 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.6_tomcat-latest - < ubuntu-12.10_openjdk-jdk-1.6_tomcat-7.0.50
