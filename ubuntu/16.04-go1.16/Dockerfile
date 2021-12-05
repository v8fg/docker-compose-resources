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

# timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# RUN wget https://golang.org/dl/go1.16.11.inux-amd64.tar.gz
RUN wget https://studygolang.com/dl/golang/go1.16.11.linux-amd64.tar.gz
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.11.linux-amd64.tar.gz && rm go1.16.11.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

# local
# ENV GOPROXY=http://10.14.41.67:8081/repository/go-group/,https://goproxy.cn,https://goproxy.io/,https://mirrors.aliyun.com/goproxy/,https://gocenter.io/,https://proxy.golang.org,direct
# public
ENV GOPROXY=https://goproxy.cn,https://goproxy.io/,https://mirrors.aliyun.com/goproxy/,https://gocenter.io/,https://proxy.golang.org,direct

RUN go version

# reduce image size
RUN apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
