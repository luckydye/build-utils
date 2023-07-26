FROM debian:bookworm-slim

RUN apt update -y && \
  apt upgrade -y && \
  apt install build-essential -y && \
  apt install git curl -y

COPY scripts/install-rtx.sh /root/install-rtx.sh

RUN chmod 700 /root/install-rtx.sh && bash /root/install-rtx.sh
