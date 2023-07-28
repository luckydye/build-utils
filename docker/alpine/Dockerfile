FROM alpine:latest

RUN apk update && \
  apk upgrade && \
  apk add --no-cache curl make gcc g++ linux-headers binutils-gold gnupg libstdc++ && \
  apk add --no-cache openssl git bash

COPY ./scripts/setup.sh /setup.sh

RUN curl https://rtx.pub/install.sh | RTX_INSTALL_PATH=/usr/local/bin/rtx sh &&\
		chmod +x /usr/local/bin/rtx&& \
    chmod +x /setup.sh
