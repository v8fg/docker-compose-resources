FROM ubuntu:18.04

LABEL maintainer="278810732@qq.com" github="https://github.com/xwi88" group="https://github.com/v8fg"

# bak
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
# replace sources.list
COPY configs/sources-18.list /etc/apt/sources.list

RUN apt-get update

ENV TZ=Asia/Shanghai DEBIAN_FRONTEND=noninteractive
# RUN apt-get install -y apt-utils
RUN apt-get install -y iputils-ping curl bash make wget \
    xz-utils tzdata git

# timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Version of upx to be used(without the 'v' prefix)
# For all releases, see https://github.com/upx/upx/releases
ARG UPX_VERSION=3.96

# Fetch upx, decompress it, make it executable.
# ADD https://github.com/upx/upx/releases/download/v${UPX_VERSION}/upx-${UPX_VERSION}-amd64_linux.tar.xz /tmp/upx.tar.xy

# wget cache
RUN wget https://github.com/upx/upx/releases/download/v${UPX_VERSION}/upx-${UPX_VERSION}-amd64_linux.tar.xz -O /tmp/upx.tar.xy

RUN tar -xJOf /tmp/upx.tar.xy upx-${UPX_VERSION}-amd64_linux/upx > /bin/upx \ 
 && chmod +x /bin/upx && rm /tmp/upx.tar.xy

# Google
RUN wget https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-2.3.0.tar.gz
RUN tar -C /usr/local -xzf libtensorflow-cpu-linux-x86_64-2.3.0.tar.gz && ldconfig && rm libtensorflow-cpu-linux-x86_64-2.3.0.tar.gz

# reduce image size
RUN apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
