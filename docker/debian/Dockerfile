FROM debian:bookworm-slim

RUN apt update -y &&\
  apt upgrade -y &&\
  apt install build-essential zlib1g-dev libssl-dev libreadline-dev libsqlite3-dev liblzma-dev libbz2-dev libffi-dev -y &&\
  apt install git curl -y

COPY ./scripts/setup.sh /setup.sh

RUN curl https://rtx.pub/install.sh | RTX_INSTALL_PATH=/usr/local/bin/rtx sh &&\
		chmod +x /usr/local/bin/rtx &&\
    chmod +x /setup.sh &&\
    alias use="rtx use"
