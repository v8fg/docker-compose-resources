FROM ubuntu:23.04 AS builder

LABEL author="xwi88" type="stable-diffusion-webui" github="https://github.com/xwi88" group="https://github.com/v8fg"

WORKDIR /

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
apt-get install -y wget git bzip2 ca-certificates curl python3 python3-venv numactl libjemalloc-dev make automake gcc g++ subversion build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev liblzma-dev ffmpeg libsm6 libxext6

RUN  wget https://static.elias.ink/python/3/Python-3.10.6.tgz && tar -zvxf Python-3.10.6.tgz && cd Python-3.10.6/ && ./configure --enable-optimizations && make && make install && ln -s /usr/local/bin/python3.10 /usr/bin/python

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git && cd stable-diffusion-webui && echo "export COMMANDLINE_ARGS=\"--skip-torch-cuda-test\"" >> webui-user.sh

RUN  useradd -m -s /bin/bash diffusion && echo "diffusion:yupoo" | chpasswd && chown -R diffusion /stable-diffusion-webui/

USER diffusion

WORKDIR /stable-diffusion-webui

# these models get loaded at runtime when first used - download them now ahead of time so that we have them available
# (determined by looking through the codebase for usages of load_models() from modules/modelloader.py)
# since the official Stable Diffision model weights require signup to download, we found an alternative URL for `sd-v1-4.ckpt` from https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Dependencies
RUN mkdir -p models/Codeformer models/GFPGAN models/Stable-diffusion
RUN wget -O models/Codeformer/codeformer-v0.1.0.pth 'https://github.com/sczhou/CodeFormer/releases/download/v0.1.0/codeformer.pth'
RUN wget -O models/GFPGAN/GFPGANv1.4.pth 'https://github.com/TencentARC/GFPGAN/releases/download/v1.3.4/GFPGANv1.4.pth'
RUN wget -O models/GFPGAN/detection_Resnet50_Final.pth 'https://github.com/xinntao/facexlib/releases/download/v0.1.0/detection_Resnet50_Final.pth'
RUN wget -O models/GFPGAN/parsing_parsenet.pth 'https://github.com/xinntao/facexlib/releases/download/v0.2.2/parsing_parsenet.pth'
RUN wget -O models/Stable-diffusion/sd-v1-4.ckpt 'https://drive.yerf.org/wl/?id=EBfTrmcCCUAGaQBXVIj5lJmEhjoP1tgl&mode=grid&download=1'

# install special CPU-oriented versions of torch and torchvision - much smaller because they don't include GPU support
# the version numbers are taken from https://github.com/AUTOMATIC1111/stable-diffusion-webui/blob/53a3dc601fb734ce433505b1ca68770919106bad/launch.py#L13
RUN pip3 install torch==1.12.1+cpu torchvision==0.13.1+cpu -f https://download.pytorch.org/whl/torch_stable.html

# install special non-graphical version of OpenCV - much smaller because they don't include graphics support
RUN pip3 install opencv-python-headless==4.6.0.66

# initialize CLIP since it downloads lots of files from the internet when first used
RUN python3 -c 'from transformers import CLIPTokenizer, CLIPTextModel; version="openai/clip-vit-large-patch14"; CLIPTokenizer.from_pretrained(version); CLIPTextModel.from_pretrained(version)'

# initialize Codeformers since it downloads lots of files from the internet when first used (mainly used for "Fix faces" option)
RUN cd repositories/CodeFormer && python3 scripts/download_pretrained_models.py facelib

RUN /bin/bash webui.sh --exit

CMD ["/bin/bash"]
