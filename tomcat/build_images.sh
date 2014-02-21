#!/bin/sh

docker build --rm -t rstiller/tomcat:ubuntu-12.04_oracle-jdk-1.7_tomcat-6.0.37 - < ubuntu-12.04_oracle-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.04_oracle-jdk-1.7_tomcat-7.0.47 - < ubuntu-12.04_oracle-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.04_oracle-jdk-1.7_tomcat-latest - < ubuntu-12.04_oracle-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:ubuntu-12.04_openjdk-jdk-1.7_tomcat-6.0.37 - < ubuntu-12.04_openjdk-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.04_openjdk-jdk-1.7_tomcat-7.0.47 - < ubuntu-12.04_openjdk-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.04_openjdk-jdk-1.7_tomcat-latest - < ubuntu-12.04_openjdk-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:ubuntu-12.04_openjdk-jdk-1.6_tomcat-6.0.37 - < ubuntu-12.04_openjdk-jdk-1.6_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.04_openjdk-jdk-1.6_tomcat-7.0.47 - < ubuntu-12.04_openjdk-jdk-1.6_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.04_openjdk-jdk-1.6_tomcat-latest - < ubuntu-12.04_openjdk-jdk-1.6_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_oracle-jdk-1.7_tomcat-6.0.37 - < ubuntu-12.10_oracle-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_oracle-jdk-1.7_tomcat-7.0.47 - < ubuntu-12.10_oracle-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_oracle-jdk-1.7_tomcat-latest - < ubuntu-12.10_oracle-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.7_tomcat-6.0.37 - < ubuntu-12.10_openjdk-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.7_tomcat-7.0.47 - < ubuntu-12.10_openjdk-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.7_tomcat-latest - < ubuntu-12.10_openjdk-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.6_tomcat-6.0.37 - < ubuntu-12.10_openjdk-jdk-1.6_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.6_tomcat-7.0.47 - < ubuntu-12.10_openjdk-jdk-1.6_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:ubuntu-12.10_openjdk-jdk-1.6_tomcat-latest - < ubuntu-12.10_openjdk-jdk-1.6_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-6.0.7_oracle-jdk-1.7_tomcat-6.0.37 - < debian-6.0.7_oracle-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_oracle-jdk-1.7_tomcat-7.0.47 - < debian-6.0.7_oracle-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_oracle-jdk-1.7_tomcat-latest - < debian-6.0.7_oracle-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-6.0.7_openjdk-jdk-1.7_tomcat-6.0.37 - < debian-6.0.7_openjdk-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_openjdk-jdk-1.7_tomcat-7.0.47 - < debian-6.0.7_openjdk-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_openjdk-jdk-1.7_tomcat-latest - < debian-6.0.7_openjdk-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-6.0.7_openjdk-jdk-1.6_tomcat-6.0.37 - < debian-6.0.7_openjdk-jdk-1.6_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_openjdk-jdk-1.6_tomcat-7.0.47 - < debian-6.0.7_openjdk-jdk-1.6_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-6.0.7_openjdk-jdk-1.6_tomcat-latest - < debian-6.0.7_openjdk-jdk-1.6_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-6.0.8_oracle-jdk-1.7_tomcat-6.0.37 - < debian-6.0.8_oracle-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-6.0.8_oracle-jdk-1.7_tomcat-7.0.47 - < debian-6.0.8_oracle-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-6.0.8_oracle-jdk-1.7_tomcat-latest - < debian-6.0.8_oracle-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-6.0.8_openjdk-jdk-1.7_tomcat-6.0.37 - < debian-6.0.8_openjdk-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-6.0.8_openjdk-jdk-1.7_tomcat-7.0.47 - < debian-6.0.8_openjdk-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-6.0.8_openjdk-jdk-1.7_tomcat-latest - < debian-6.0.8_openjdk-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-6.0.8_openjdk-jdk-1.6_tomcat-6.0.37 - < debian-6.0.8_openjdk-jdk-1.6_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-6.0.8_openjdk-jdk-1.6_tomcat-7.0.47 - < debian-6.0.8_openjdk-jdk-1.6_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-6.0.8_openjdk-jdk-1.6_tomcat-latest - < debian-6.0.8_openjdk-jdk-1.6_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-7.0_oracle-jdk-1.7_tomcat-6.0.37 - < debian-7.0_oracle-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-7.0_oracle-jdk-1.7_tomcat-7.0.47 - < debian-7.0_oracle-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-7.0_oracle-jdk-1.7_tomcat-latest - < debian-7.0_oracle-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-7.0_openjdk-jdk-1.7_tomcat-6.0.37 - < debian-7.0_openjdk-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-7.0_openjdk-jdk-1.7_tomcat-7.0.47 - < debian-7.0_openjdk-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-7.0_openjdk-jdk-1.7_tomcat-latest - < debian-7.0_openjdk-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-7.0_openjdk-jdk-1.6_tomcat-6.0.37 - < debian-7.0_openjdk-jdk-1.6_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-7.0_openjdk-jdk-1.6_tomcat-7.0.47 - < debian-7.0_openjdk-jdk-1.6_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-7.0_openjdk-jdk-1.6_tomcat-latest - < debian-7.0_openjdk-jdk-1.6_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-7.1_oracle-jdk-1.7_tomcat-6.0.37 - < debian-7.1_oracle-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-7.1_oracle-jdk-1.7_tomcat-7.0.47 - < debian-7.1_oracle-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-7.1_oracle-jdk-1.7_tomcat-latest - < debian-7.1_oracle-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-7.1_openjdk-jdk-1.7_tomcat-6.0.37 - < debian-7.1_openjdk-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-7.1_openjdk-jdk-1.7_tomcat-7.0.47 - < debian-7.1_openjdk-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-7.1_openjdk-jdk-1.7_tomcat-latest - < debian-7.1_openjdk-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-7.1_openjdk-jdk-1.6_tomcat-6.0.37 - < debian-7.1_openjdk-jdk-1.6_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-7.1_openjdk-jdk-1.6_tomcat-7.0.47 - < debian-7.1_openjdk-jdk-1.6_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-7.1_openjdk-jdk-1.6_tomcat-latest - < debian-7.1_openjdk-jdk-1.6_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-7.2_oracle-jdk-1.7_tomcat-6.0.37 - < debian-7.2_oracle-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-7.2_oracle-jdk-1.7_tomcat-7.0.47 - < debian-7.2_oracle-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-7.2_oracle-jdk-1.7_tomcat-latest - < debian-7.2_oracle-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-7.2_openjdk-jdk-1.7_tomcat-6.0.37 - < debian-7.2_openjdk-jdk-1.7_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-7.2_openjdk-jdk-1.7_tomcat-7.0.47 - < debian-7.2_openjdk-jdk-1.7_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-7.2_openjdk-jdk-1.7_tomcat-latest - < debian-7.2_openjdk-jdk-1.7_tomcat-7.0.47 && \
 \
docker build --rm -t rstiller/tomcat:debian-7.2_openjdk-jdk-1.6_tomcat-6.0.37 - < debian-7.2_openjdk-jdk-1.6_tomcat-6.0.37 && \
docker build --rm -t rstiller/tomcat:debian-7.2_openjdk-jdk-1.6_tomcat-7.0.47 - < debian-7.2_openjdk-jdk-1.6_tomcat-7.0.47 && \
docker build --rm -t rstiller/tomcat:debian-7.2_openjdk-jdk-1.6_tomcat-latest - < debian-7.2_openjdk-jdk-1.6_tomcat-7.0.47
