FROM ubuntu:20.04

ENV TZ=Asia/Shanghai DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y ca-certificates && \
    apt-get install -y tzdata openjdk-11-jdk && \
    apt-get install -y python3 python3-pip && \
    pip --timeout 1000 install pystache pyyaml && \
    apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# bak
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
# replace sources.list
COPY configs/sources-20.list /etc/apt/sources.list

