FROM python:3.9

LABEL maintainer="278810732@qq.com" github="https://github.com/xwi88" group="https://github.com/v8fg"
ENV TZ=Asia/Shanghai

USER root

# WORKDIR /code
# ADD tmp_sources/requirements.txt /code/requirements.txt
# ADD tmp_sources/sources.list /etc/apt/sources.list
# ADD tmp_sources/chromedriver /code/chromedriver
# ADD tmp_sources/google-chrome-stable_current_amd64.deb /opt

RUN apt-get update
RUN apt-get install -y tzdata bash

# RUN pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple/
# RUN pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/
# RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN apt-get install -y cron libx11-xcb1 libudev1 -yq

RUN apt autoremove -y 
# RUN apt-get install --fix-missing /opt/google-chrome* -yq
# RUN cp /code/chromedriver /usr/bin/
# RUN rm /code/chromedriver /opt/google-chrome-stable_current_amd64.deb

# CMD ["/bin/bash"]
