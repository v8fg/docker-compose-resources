FROM v8fg/ubuntu:18.04

LABEL author="xwi88" type="ubuntu" github="https://github.com/xwi88" group="https://github.com/v8fg"

RUN wget https://golang.google.cn/dl/go1.20.4.linux-amd64.tar.gz && \
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz && rm go1.20.4.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin GOPROXY=https://goproxy.cn,https://goproxy.io/,https://mirrors.aliyun.com/goproxy/,https://gocenter.io/,https://proxy.golang.org,direct
