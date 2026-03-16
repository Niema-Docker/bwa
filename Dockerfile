# Minimal Docker image for BWA using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install BWA
RUN apk update && \
    apk add bash gcc make musl-dev zlib-dev && \
    wget -qO- "https://github.com/lh3/bwa/archive/refs/tags/v0.7.19.tar.gz" | tar -zx && \
    cd bwa-* && \
    sed -i 's/const uint8_t rle_auxtab\[8\];/\/\/const uint8_t rle_auxtab\[8\];/g' rle.h && \
    make && \
    mv bwa /usr/local/bin/bwa && \
    cd .. && \
    rm -rf bwa-*
