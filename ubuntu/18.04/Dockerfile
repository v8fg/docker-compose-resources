FROM ubuntu:18.04

LABEL author="xwi88" type="ubuntu" github="https://github.com/xwi88" group="https://github.com/v8fg"

ENV TZ=Asia/Shanghai DEBIAN_FRONTEND=noninteractive

# bak
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
# replace sources.list
COPY configs/sources-18.list /etc/apt/sources.list

RUN apt-get update && \
apt-get install -y iputils-ping curl bash make wget && \
apt-get install -y xz-utils tzdata git && \
apt-get install -y gcc g++ && \
apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# apt-get install -y apt-utils

# timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
