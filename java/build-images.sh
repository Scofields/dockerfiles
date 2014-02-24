#!/bin/sh

docker build --rm -t rstiller/java:debian-6.0.7_openjdk_jdk-1.6 - < debian-6.0.7_openjdk_jdk-1.6 && \
docker build --rm -t rstiller/java:debian-6.0.7_openjdk_jre-1.6 - < debian-6.0.7_openjdk_jre-1.6 && \
docker build --rm -t rstiller/java:debian-6.0.7_oracle_jre-1.7 - < debian-6.0.7_oracle_jre-1.7 && \
 \
docker build --rm -t rstiller/java:debian-6.0.8_openjdk_jdk-1.6 - < debian-6.0.8_openjdk_jdk-1.6 && \
docker build --rm -t rstiller/java:debian-6.0.8_openjdk_jre-1.6 - < debian-6.0.8_openjdk_jre-1.6 && \
docker build --rm -t rstiller/java:debian-6.0.8_oracle_jre-1.7 - < debian-6.0.8_oracle_jre-1.7 && \
 \
docker build --rm -t rstiller/java:debian-7.0_openjdk_jdk-1.6 - < debian-7.0_openjdk_jdk-1.6 && \
docker build --rm -t rstiller/java:debian-7.0_openjdk_jre-1.6 - < debian-7.0_openjdk_jre-1.6 && \
docker build --rm -t rstiller/java:debian-7.0_openjdk_jdk-1.7 - < debian-7.0_openjdk_jdk-1.7 && \
docker build --rm -t rstiller/java:debian-7.0_openjdk_jre-1.7 - < debian-7.0_openjdk_jre-1.7 && \
docker build --rm -t rstiller/java:debian-7.0_oracle_jre-1.7 - < debian-7.0_oracle_jre-1.7 && \
 \
docker build --rm -t rstiller/java:debian-7.1_openjdk_jdk-1.6 - < debian-7.1_openjdk_jdk-1.6 && \
docker build --rm -t rstiller/java:debian-7.1_openjdk_jre-1.6 - < debian-7.1_openjdk_jre-1.6 && \
docker build --rm -t rstiller/java:debian-7.1_openjdk_jdk-1.7 - < debian-7.1_openjdk_jdk-1.7 && \
docker build --rm -t rstiller/java:debian-7.1_openjdk_jre-1.7 - < debian-7.1_openjdk_jre-1.7 && \
docker build --rm -t rstiller/java:debian-7.1_oracle_jre-1.7 - < debian-7.1_oracle_jre-1.7 && \
 \
docker build --rm -t rstiller/java:debian-7.2_openjdk_jdk-1.6 - < debian-7.2_openjdk_jdk-1.6 && \
docker build --rm -t rstiller/java:debian-7.2_openjdk_jre-1.6 - < debian-7.2_openjdk_jre-1.6 && \
docker build --rm -t rstiller/java:debian-7.2_openjdk_jdk-1.7 - < debian-7.2_openjdk_jdk-1.7 && \
docker build --rm -t rstiller/java:debian-7.2_openjdk_jre-1.7 - < debian-7.2_openjdk_jre-1.7 && \
docker build --rm -t rstiller/java:debian-7.2_oracle_jre-1.7 - < debian-7.2_oracle_jre-1.7 && \
 \
docker build --rm -t rstiller/java:debian-7.3_openjdk_jdk-1.6 - < debian-7.3_openjdk_jdk-1.6 && \
docker build --rm -t rstiller/java:debian-7.3_openjdk_jre-1.6 - < debian-7.3_openjdk_jre-1.6 && \
docker build --rm -t rstiller/java:debian-7.3_openjdk_jdk-1.7 - < debian-7.3_openjdk_jdk-1.7 && \
docker build --rm -t rstiller/java:debian-7.3_openjdk_jre-1.7 - < debian-7.3_openjdk_jre-1.7 && \
docker build --rm -t rstiller/java:debian-7.3_oracle_jre-1.7 - < debian-7.3_oracle_jre-1.7 && \
 \
docker build --rm -t rstiller/java:ubuntu-12.04_openjdk_jdk-1.6 - < ubuntu-12.04_openjdk_jdk-1.6 && \
docker build --rm -t rstiller/java:ubuntu-12.04_openjdk_jdk-1.7 - < ubuntu-12.04_openjdk_jdk-1.7 && \
docker build --rm -t rstiller/java:ubuntu-12.04_openjdk_jre-1.6 - < ubuntu-12.04_openjdk_jre-1.6 && \
docker build --rm -t rstiller/java:ubuntu-12.04_openjdk_jre-1.7 - < ubuntu-12.04_openjdk_jre-1.7 && \
docker build --rm -t rstiller/java:ubuntu-12.04_oracle_jre-1.6 - < ubuntu-12.04_oracle_jre-1.6 && \
docker build --rm -t rstiller/java:ubuntu-12.04_oracle_jre-1.7 - < ubuntu-12.04_oracle_jre-1.7
