FROM debian:stable

RUN apt update -y &&\
  apt install build-essential -y &&\
  apt install git curl -y

RUN curl https://rtx.pub/install.sh | RTX_INSTALL_PATH=/usr/local/bin/rtx sh &&\
    sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d

ENV PATH="/root/.local/share/rtx/shims:${PATH}"
