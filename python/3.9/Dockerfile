FROM python:3.9

LABEL maintainer="278810732@qq.com" github="https://github.com/xwi88" group="https://github.com/v8fg"
ENV TZ=Asia/Shanghai

USER root

RUN apt-get update
RUN apt-get install -y tzdata bash

RUN pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN apt-get install -y cron libx11-xcb1 libudev1 -yq

RUN apt autoremove -y 

# CMD ["/bin/bash"]
