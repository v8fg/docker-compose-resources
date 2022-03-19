ARG FROM_REPOSITORY=alpine FROM_TAG=3.15.1

FROM ${FROM_REPOSITORY}:${FROM_TAG}

LABEL author=xwi88 type=demo name=latest github="https://github.com/xwi88" group="https://github.com/v8fg"

RUN apk add --no-cache tzdata bash

ENV TZ=Asia/Shanghai
