FROM golang:1.20-alpine3.17

LABEL author="xwi88" type="go" github="https://github.com/xwi88" group="https://github.com/v8fg"

# Version of upx to be used(without the 'v' prefix)
# For all releases, see https://github.com/upx/upx/releases
ARG UPX_VERSION=4.0.2

# Fetch upx, decompress it, make it executable.
ADD https://github.com/upx/upx/releases/download/v${UPX_VERSION}/upx-${UPX_VERSION}-amd64_linux.tar.xz /tmp/upx.tar.xy

RUN apk add --no-cache tzdata git make bash && \
tar -xJOf /tmp/upx.tar.xy upx-${UPX_VERSION}-amd64_linux/upx > /bin/upx \
&& chmod +x /bin/upx && rm /tmp/upx.tar.xy
