FROM ubuntu:16.04

LABEL maintainer="278810732@qq.com" github="https://github.com/xwi88" group="https://github.com/v8fg"

# bak
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak

# replace sources.list
COPY configs/sources-16.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y apt-utils bash make wget xz-utils tzdata git
RUN git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
RUN apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Version of upx to be used(without the 'v' prefix)
# For all releases, see https://github.com/upx/upx/releases
ARG UPX_VERSION=3.96

# Fetch upx, decompress it, make it executable.
# wget cache
RUN wget https://github.com/upx/upx/releases/download/v${UPX_VERSION}/upx-${UPX_VERSION}-amd64_linux.tar.xz -O /tmp/upx.tar.xy
# ADD https://github.com/upx/upx/releases/download/v${UPX_VERSION}/upx-${UPX_VERSION}-amd64_linux.tar.xz /tmp/upx.tar.xy

RUN tar -xJOf /tmp/upx.tar.xy upx-${UPX_VERSION}-amd64_linux/upx > /bin/upx \ 
 && chmod +x /bin/upx && rm /tmp/upx.tar.xy

ENV TZ=Asia/Shanghai
