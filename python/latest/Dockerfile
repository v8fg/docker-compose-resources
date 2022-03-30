FROM python:3.7.11

LABEL author="xwi88" type="python" github="https://github.com/xwi88" group="https://github.com/v8fg"

ENV TZ=Asia/Shanghai

USER root

RUN apt-get update

RUN pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN apt-get install -y tzdata bash cron libx11-xcb1 libudev1 -yq

RUN apt autoremove -y 

# CMD ["/bin/bash"]
