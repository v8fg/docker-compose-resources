FROM jenkins/jenkins:2.324-alpine

LABEL maintainer="278810732@qq.com" github="https://github.com/xwi88" group="https://github.com/v8fg"

USER root

RUN apk add --no-cache tzdata bash

# RUN wget https://studygolang.com/dl/golang/go1.17.5.linux-amd64.tar.gz && \
RUN wget https://golang.org/dl/go1.17.5.linux-amd64.tar.gz && \
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz && rm go1.17.5.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin GOPROXY=https://goproxy.cn,https://goproxy.io/,https://mirrors.aliyun.com/goproxy/,https://gocenter.io/,https://proxy.golang.org,direct


# Version of upx to be used(without the 'v' prefix)
# For all releases, see https://github.com/upx/upx/releases
ARG UPX_VERSION=3.96

# Fetch upx, decompress it, make it executable.
# ADD https://github.com/upx/upx/releases/download/v${UPX_VERSION}/upx-${UPX_VERSION}-amd64_linux.tar.xz /tmp/upx.tar.xy

# wget cache
RUN wget https://github.com/upx/upx/releases/download/v${UPX_VERSION}/upx-${UPX_VERSION}-amd64_linux.tar.xz -O /tmp/upx.tar.xy && \
tar -xJOf /tmp/upx.tar.xy upx-${UPX_VERSION}-amd64_linux/upx > /bin/upx && chmod +x /bin/upx && rm /tmp/upx.tar.xy


ENV TZ=Asia/Shanghai

USER jenkins
