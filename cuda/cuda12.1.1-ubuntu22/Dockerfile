FROM nvidia/cuda:12.1.1-base-ubuntu22.04 AS builder

LABEL author="xwi88" type="cuda" github="https://github.com/xwi88" group="https://github.com/v8fg"

WORKDIR /

ENV TZ=Asia/Shanghai DEBIAN_FRONTEND=noninteractive
ENV USER=app WORKDIR=app

RUN apt-get update && \
apt-get install -y tzdata bash wget git bzip2 ca-certificates curl python3 python3-venv numactl libjemalloc-dev make automake gcc g++ subversion build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev liblzma-dev ffmpeg libsm6 libxext6
    
RUN wget https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tgz && tar -zvxf Python-3.9.16.tgz && cd Python-3.9.16/ && ./configure --enable-optimizations && make && make install && ln -s /usr/local/bin/python3.9 /usr/bin/python && \
python3.9 -m pip install --upgrade pip && pip3 install --upgrade pip && \
pip3 install fastapi uvicorn protobuf cpm_kernels gradio mdtex2html sentencepiece icetk

RUN pip3 install transformers==4.26.1 && pip3 install torch>=1.10

ENV JITTOR_HOME=/data

RUN git clone https://github.com/Jittor/JittorLLMs --depth 1 && cd JittorLLMs && \
git reset --hard 4bb3fd6fa09c8f96852d7932e47e7aa073c149c6 && pip3 install -r requirements.txt -i https://pypi.jittor.org/simple -I && \
pip3 install jittor -U -i https://pypi.org/simple && \
useradd -m -s /usr/bin/bash ${USER} && echo "${USER}:app" | chpasswd && \
chown -R ${USER} /JittorLLMs/

RUN apt autoremove -y

USER ${USER}

WORKDIR /JittorLLMs

CMD ["/bin/bash"]
