FROM debian:bookworm-slim

RUN apt update -y && \
  apt upgrade -y && \
  apt install build-essential -y && \
  apt install git curl -y

RUN curl https://rtx.pub/install.sh | RTX_INSTALL_PATH=/usr/local/bin/rtx sh &&\
		chmod +x /usr/local/bin/rtx

COPY ./scripts/setup.sh /setup.sh
RUN chmod +x /setup.sh
