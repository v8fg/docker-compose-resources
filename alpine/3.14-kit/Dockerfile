FROM alpine:3.14

LABEL maintainer="278810732@qq.com" github="https://github.com/xwi88" group="https://github.com/v8fg"

RUN apk add --no-cache tzdata bash tini mtr dhclient

RUN mkdir -p /etc/udhcpc && echo "RESOLV_CONF=no" > /etc/udhcpc/udhcpc.conf
# RUN cat /etc/resolv.conf | sed '/nameserver/ c\ nameserver 8.8.8.8' > /etc/resolv.conf
# RUN echo 'nameserver 8.8.8.8' >> /etc/resolv.conf && echo 'nameserver 8.8.4.4' >> /etc/resolv.conf
# RUN echo 'nameserver 114.114.114.114' >> /etc/resolv.conf

ENV TZ=Asia/Shanghai
