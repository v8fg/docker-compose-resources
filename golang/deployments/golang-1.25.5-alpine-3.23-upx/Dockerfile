# --- Stage 1: Define Environment & Metadata ---
# Use an build-time argument for the base image to increase flexibility
FROM golang:1.25.5-alpine3.23

# Set organizational metadata and maintainer information
LABEL author="xwi88" \
      type="go" \
      maintainer="278810732@qq.com" \
      github="github.com" \
      group="github.com"

# --- Stage 2: Build Arguments & Dependencies ---
# Specify UPX version (exclude 'v' prefix). 
# Release notes: https://github.com/upx/upx/releases
ARG UPX_VERSION=5.0.2

# Download UPX binary for executable compression
ADD https://github.com/upx/upx/releases/download/v${UPX_VERSION}/upx-${UPX_VERSION}-amd64_linux.tar.xz /tmp/upx.tar.xy

# --- Stage 3: System Setup & UPX Installation ---
# 1. Install essential build tools and timezone data
# 2. Extract UPX binary from the tarball directly to /bin
# 3. Clean up temporary files to minimize image size
RUN apk add --no-cache tzdata git make bash && \
    tar -xJOf /tmp/upx.tar.xy upx-${UPX_VERSION}-amd64_linux/upx > /bin/upx && \
    chmod +x /bin/upx && \
    rm /tmp/upx.tar.xy
