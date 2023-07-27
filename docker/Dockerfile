FROM debian:bookworm-slim

RUN apt update -y && \
  apt upgrade -y && \
  apt install build-essential -y && \
  apt install git curl -y

RUN curl https://rtx.pub/install.sh | RTX_INSTALL_PATH=/usr/local/bin/rtx sh &&\
		chmod +x /usr/local/bin/rtx

RUN curl -s -L https://raw.githubusercontent.com/luckydye/configs/main/setup.sh | bash

COPY ./scripts/install.sh /usr/local/bin/install.sh
RUN chmod +x /usr/local/bin/install.sh
