# Minimal Docker image for BWA using Alpine base
FROM alpine:latest

# install BWA
RUN apk update && \
    apk add --no-cache bash gcc make musl-dev zlib-dev && \
    wget -qO- "https://github.com/lh3/bwa/archive/refs/tags/v0.7.19.tar.gz" | tar -zx && \
    cd bwa-* && \
    make && \
    mv bwa /usr/local/bin/bwa && \
    cd .. && \
    rm -rf bwa-*
