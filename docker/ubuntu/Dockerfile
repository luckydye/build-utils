FROM ubuntu

RUN apt update -y &&\
  apt upgrade -y &&\
  apt install build-essential zlib1g-dev libssl-dev libreadline-dev libsqlite3-dev liblzma-dev libbz2-dev libffi-dev -y &&\
  apt install git curl -y

RUN curl https://raw.githubusercontent.com/luckydye/setup/main/setup.sh | bash &&\
    ln -s /root/bin/rtx /usr/local/bin/rtx

ENV PATH="/.local/share/rtx/shims:${PATH}"
