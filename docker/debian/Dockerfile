FROM debian:stable

RUN apt update -y &&\
  apt install build-essential zlib1g-dev libssl-dev libreadline-dev libsqlite3-dev liblzma-dev libbz2-dev libffi-dev -y &&\
  apt install git curl -y

RUN curl https://rtx.pub/install.sh | RTX_INSTALL_PATH=/usr/local/bin/rtx sh &&\
    sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d

ENV PATH="/root/.local/share/rtx/shims:${PATH}"
