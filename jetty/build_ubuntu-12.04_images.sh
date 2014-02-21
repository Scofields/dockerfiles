#!/bin/bash

docker build -t rstiller/jetty:ubuntu-12.04_openjdk_jdk-1.6_jetty-9.1.0 - < ubuntu-12.04_openjdk_jdk-1.6_jetty-9.x && \
docker build -t rstiller/jetty:ubuntu-12.04_openjdk_jdk-1.6_jetty-9-latest - < ubuntu-12.04_openjdk_jdk-1.6_jetty-9.x && \
docker build -t rstiller/jetty:ubuntu-12.04_openjdk_jdk-1.7_jetty-9.1.0 - < ubuntu-12.04_openjdk_jdk-1.7_jetty-9.x && \
docker build -t rstiller/jetty:ubuntu-12.04_openjdk_jdk-1.7_jetty-9-latest - < ubuntu-12.04_openjdk_jdk-1.7_jetty-9.x && \
docker build -t rstiller/jetty:ubuntu-12.04_oracle_jdk-1.6_jetty-9.1.0 - < ubuntu-12.04_oracle_jdk-1.6_jetty-9.x && \
docker build -t rstiller/jetty:ubuntu-12.04_oracle_jdk-1.6_jetty-9-latest - < ubuntu-12.04_oracle_jdk-1.6_jetty-9.x && \
docker build -t rstiller/jetty:ubuntu-12.04_oracle_jdk-1.7_jetty-9.1.0 - < ubuntu-12.04_oracle_jdk-1.7_jetty-9.x && \
docker build -t rstiller/jetty:ubuntu-12.04_oracle_jdk-1.7_jetty-9-latest - < ubuntu-12.04_oracle_jdk-1.7_jetty-9.x && \
 \
docker build -t rstiller/jetty:ubuntu-12.04_openjdk_jdk-1.6_jetty-8.1.14 - < ubuntu-12.04_openjdk_jdk-1.6_jetty-8.x && \
docker build -t rstiller/jetty:ubuntu-12.04_openjdk_jdk-1.6_jetty-8-latest - < ubuntu-12.04_openjdk_jdk-1.6_jetty-8.x && \
docker build -t rstiller/jetty:ubuntu-12.04_openjdk_jdk-1.7_jetty-8.1.14 - < ubuntu-12.04_openjdk_jdk-1.7_jetty-8.x && \
docker build -t rstiller/jetty:ubuntu-12.04_openjdk_jdk-1.7_jetty-8-latest - < ubuntu-12.04_openjdk_jdk-1.7_jetty-8.x && \
docker build -t rstiller/jetty:ubuntu-12.04_oracle_jdk-1.6_jetty-8.1.14 - < ubuntu-12.04_oracle_jdk-1.6_jetty-8.x && \
docker build -t rstiller/jetty:ubuntu-12.04_oracle_jdk-1.6_jetty-8-latest - < ubuntu-12.04_oracle_jdk-1.6_jetty-8.x && \
docker build -t rstiller/jetty:ubuntu-12.04_oracle_jdk-1.7_jetty-8.1.14 - < ubuntu-12.04_oracle_jdk-1.7_jetty-8.x && \
docker build -t rstiller/jetty:ubuntu-12.04_oracle_jdk-1.7_jetty-8-latest - < ubuntu-12.04_oracle_jdk-1.7_jetty-8.x && \
 \
docker build -t rstiller/jetty:ubuntu-12.04_openjdk_jdk-1.6_jetty-7.6.14 - < ubuntu-12.04_openjdk_jdk-1.6_jetty-7.x && \
docker build -t rstiller/jetty:ubuntu-12.04_openjdk_jdk-1.6_jetty-7-latest - < ubuntu-12.04_openjdk_jdk-1.6_jetty-7.x && \
docker build -t rstiller/jetty:ubuntu-12.04_openjdk_jdk-1.7_jetty-7.6.14 - < ubuntu-12.04_openjdk_jdk-1.7_jetty-7.x && \
docker build -t rstiller/jetty:ubuntu-12.04_openjdk_jdk-1.7_jetty-7-latest - < ubuntu-12.04_openjdk_jdk-1.7_jetty-7.x && \
docker build -t rstiller/jetty:ubuntu-12.04_oracle_jdk-1.6_jetty-7.6.14 - < ubuntu-12.04_oracle_jdk-1.6_jetty-7.x && \
docker build -t rstiller/jetty:ubuntu-12.04_oracle_jdk-1.6_jetty-7-latest - < ubuntu-12.04_oracle_jdk-1.6_jetty-7.x && \
docker build -t rstiller/jetty:ubuntu-12.04_oracle_jdk-1.7_jetty-7.6.14 - < ubuntu-12.04_oracle_jdk-1.7_jetty-7.x && \
docker build -t rstiller/jetty:ubuntu-12.04_oracle_jdk-1.7_jetty-7-latest - < ubuntu-12.04_oracle_jdk-1.7_jetty-7.x
