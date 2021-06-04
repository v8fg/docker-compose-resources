FROM ubuntu:16.04

LABEL maintainer="278810732@qq.com" github="https://github.com/xwi88" group="https://github.com/v8fg"

# bak
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
# replace sources.list
COPY configs/sources-16.list /etc/apt/sources.list

RUN apt-get update
# RUN apt-get install -y apt-utils
RUN apt-get install -y iputils-ping curl bash make wget

RUN apt-get install -y xz-utils tzdata git
RUN git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# compile use
RUN apt-get install -y gcc g++

# tini install, pid control
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /sbin/tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /sbin/tini.asc
# RUN gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
#  && gpg --batch --verify /usr/bin/tini.asc /usr/bin/tini
RUN chmod +x /sbin/tini

# timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# RUN wget https://golang.org/doc/install?download=go1.16.4.linux-amd64.tar.gz
RUN wget http://qtg5a7g51.hb-bkt.clouddn.com/go1.16.4.linux-amd64.tar.gz
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz && rm go1.16.4.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

# local
# ENV GOPROXY=http://10.14.41.67:8081/repository/go-group/,https://goproxy.cn,https://goproxy.io/,https://mirrors.aliyun.com/goproxy/,https://gocenter.io/,https://proxy.golang.org,direct
# public
ENV GOPROXY=https://goproxy.cn,https://goproxy.io/,https://mirrors.aliyun.com/goproxy/,https://gocenter.io/,https://proxy.golang.org,direct

RUN go version

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
# RUN wget https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-2.3.0.tar.gz

# QINIU cache
RUN wget http://qtg5a7g51.hb-bkt.clouddn.com/libtensorflow-cpu-linux-x86_64-2.3.0.tar.gz
RUN tar -C /usr/local -xzf libtensorflow-cpu-linux-x86_64-2.3.0.tar.gz && ldconfig && rm libtensorflow-cpu-linux-x86_64-2.3.0.tar.gz

# reduce image size
RUN apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
