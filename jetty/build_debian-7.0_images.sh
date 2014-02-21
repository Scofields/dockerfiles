#!/bin/bash

docker build -t rstiller/jetty:debian-7.0_openjdk_jdk-1.6_jetty-9.1.0 - < debian-7.0_openjdk_jdk-1.6_jetty-9.x && \
docker build -t rstiller/jetty:debian-7.0_openjdk_jdk-1.6_jetty-9-latest - < debian-7.0_openjdk_jdk-1.6_jetty-9.x && \
docker build -t rstiller/jetty:debian-7.0_openjdk_jdk-1.7_jetty-9.1.0 - < debian-7.0_openjdk_jdk-1.7_jetty-9.x && \
docker build -t rstiller/jetty:debian-7.0_openjdk_jdk-1.7_jetty-9-latest - < debian-7.0_openjdk_jdk-1.7_jetty-9.x && \
docker build -t rstiller/jetty:debian-7.0_oracle_jdk-1.6_jetty-9.1.0 - < debian-7.0_oracle_jdk-1.6_jetty-9.x && \
docker build -t rstiller/jetty:debian-7.0_oracle_jdk-1.6_jetty-9-latest - < debian-7.0_oracle_jdk-1.6_jetty-9.x && \
docker build -t rstiller/jetty:debian-7.0_oracle_jdk-1.7_jetty-9.1.0 - < debian-7.0_oracle_jdk-1.7_jetty-9.x && \
docker build -t rstiller/jetty:debian-7.0_oracle_jdk-1.7_jetty-9-latest - < debian-7.0_oracle_jdk-1.7_jetty-9.x && \
 \
docker build -t rstiller/jetty:debian-7.0_openjdk_jdk-1.6_jetty-8.1.14 - < debian-7.0_openjdk_jdk-1.6_jetty-8.x && \
docker build -t rstiller/jetty:debian-7.0_openjdk_jdk-1.6_jetty-8-latest - < debian-7.0_openjdk_jdk-1.6_jetty-8.x && \
docker build -t rstiller/jetty:debian-7.0_openjdk_jdk-1.7_jetty-8.1.14 - < debian-7.0_openjdk_jdk-1.7_jetty-8.x && \
docker build -t rstiller/jetty:debian-7.0_openjdk_jdk-1.7_jetty-8-latest - < debian-7.0_openjdk_jdk-1.7_jetty-8.x && \
docker build -t rstiller/jetty:debian-7.0_oracle_jdk-1.6_jetty-8.1.14 - < debian-7.0_oracle_jdk-1.6_jetty-8.x && \
docker build -t rstiller/jetty:debian-7.0_oracle_jdk-1.6_jetty-8-latest - < debian-7.0_oracle_jdk-1.6_jetty-8.x && \
docker build -t rstiller/jetty:debian-7.0_oracle_jdk-1.7_jetty-8.1.14 - < debian-7.0_oracle_jdk-1.7_jetty-8.x && \
docker build -t rstiller/jetty:debian-7.0_oracle_jdk-1.7_jetty-8-latest - < debian-7.0_oracle_jdk-1.7_jetty-8.x && \
 \
docker build -t rstiller/jetty:debian-7.0_openjdk_jdk-1.6_jetty-7.6.14 - < debian-7.0_openjdk_jdk-1.6_jetty-7.x && \
docker build -t rstiller/jetty:debian-7.0_openjdk_jdk-1.6_jetty-7-latest - < debian-7.0_openjdk_jdk-1.6_jetty-7.x && \
docker build -t rstiller/jetty:debian-7.0_openjdk_jdk-1.7_jetty-7.6.14 - < debian-7.0_openjdk_jdk-1.7_jetty-7.x && \
docker build -t rstiller/jetty:debian-7.0_openjdk_jdk-1.7_jetty-7-latest - < debian-7.0_openjdk_jdk-1.7_jetty-7.x && \
docker build -t rstiller/jetty:debian-7.0_oracle_jdk-1.6_jetty-7.6.14 - < debian-7.0_oracle_jdk-1.6_jetty-7.x && \
docker build -t rstiller/jetty:debian-7.0_oracle_jdk-1.6_jetty-7-latest - < debian-7.0_oracle_jdk-1.6_jetty-7.x && \
docker build -t rstiller/jetty:debian-7.0_oracle_jdk-1.7_jetty-7.6.14 - < debian-7.0_oracle_jdk-1.7_jetty-7.x && \
docker build -t rstiller/jetty:debian-7.0_oracle_jdk-1.7_jetty-7-latest - < debian-7.0_oracle_jdk-1.7_jetty-7.x
