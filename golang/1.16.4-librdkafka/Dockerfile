FROM golang:1.16.4-alpine3.13

LABEL maintainer="278810732@qq.com" github="https://github.com/xwi88" group="https://github.com/v8fg"

###/etc/apk/repositories
# http://dl-cdn.alpinelinux.org/alpine/v3.13/main
# http://dl-cdn.alpinelinux.org/alpine/v3.13/community
### replace tsinghua source
# sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

# RUN echo “https://mirror.tuna.tsinghua.edu.cn/alpine/v3.13/main” > /etc/apk/repositories \
#  && echo “https://mirror.tuna.tsinghua.edu.cn/alpine/v3.13/community” >> /etc/apk/repositories \
#  && apk add --no-cache tzdata git make bash gcc libc-dev librdkafka-dev pkgconf

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

# ref: https://github.com/confluentinc/confluent-kafka-go
# RUN apk add --no-cache tzdata git make bash gcc g++ libc-dev librdkafka-dev pkgconf
RUN apk add --no-cache tzdata git make bash gcc g++ libc-dev pkgconf
RUN git clone https://gitee.com/xwi88/librdkafka.git /tmp/librdkafka && cd /tmp/librdkafka && ./configure && make && make install
RUN rm -rf /tmp/librdkafka

ARG UPX_VERSION=3.96
# Fetch upx, decompress it, make it executable.
ADD https://github.com/upx/upx/releases/download/v${UPX_VERSION}/upx-${UPX_VERSION}-amd64_linux.tar.xz /tmp/upx.tar.xy
RUN tar -xJOf /tmp/upx.tar.xy upx-${UPX_VERSION}-amd64_linux/upx > /bin/upx \ 
 && chmod +x /bin/upx && rm /tmp/upx.tar.xy

ENV TZ=Asia/Shanghai
ENV LD_LIBRARY_PATH=/usr/local/lib
