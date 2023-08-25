FROM v8fg/ubuntu:23.04

LABEL author="xwi88" type="ubuntu" github="https://github.com/xwi88" group="https://github.com/v8fg"

# Google libtensorflow
RUN wget https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-2.3.0.tar.gz && tar -C /usr/local -xzf libtensorflow-cpu-linux-x86_64-2.3.0.tar.gz && ldconfig && rm libtensorflow-cpu-linux-x86_64-2.3.0.tar.gz
