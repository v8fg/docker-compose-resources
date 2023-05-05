FROM nvidia/cuda:12.1.0-base-ubuntu20.04 AS builder

LABEL author="xwi88" type="stable-diffusion-webui" github="https://github.com/xwi88" group="https://github.com/v8fg"

WORKDIR /

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y wget git bzip2 ca-certificates curl python3 python3-venv numactl libjemalloc-dev make automake gcc g++ subversion build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev liblzma-dev ffmpeg libsm6 libxext6 && \
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git && cd stable-diffusion-webui && echo "export COMMANDLINE_ARGS=\"--skip-torch-cuda-test\"" >> webui-user.sh && \
    wget https://static.elias.ink/python/3/Python-3.10.6.tgz && tar -zvxf Python-3.10.6.tgz && cd Python-3.10.6/ && ./configure --enable-optimizations && make && make install && ln -s /usr/local/bin/python3.10 /usr/bin/python && \
    useradd -m -s /bin/bash diffusion && echo "diffusion:yupoo" | chpasswd && \
    chown -R diffusion /stable-diffusion-webui/

USER diffusion

WORKDIR /stable-diffusion-webui

RUN /bin/bash webui.sh --exit

CMD ["/bin/bash"]
