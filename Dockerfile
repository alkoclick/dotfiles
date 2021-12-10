# 22.04 digest, https://registry.hub.docker.com/_/ubuntu?tab=tags&page=1&name=22.04
FROM ubuntu@sha256:3c3de9608507804525ff4303874525760ea36d62606e8105f515adaa761b80cb

ENV DEBIAN_FRONTEND=noninteractive

# Base dependencies that would otherwise exist in a normal Ubuntu system
RUN apt-get update -qq \
  &&\
  apt-get install -qq --no-install-recommends \
    ca-certificates \
    curl \
    gcc \
    git \
    gpg \
    sudo \
    unzip \
    > /dev/null \
  &&\
  rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash alexander &&\
    echo 'alexander ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

COPY . /home/alexander/dotfiles
WORKDIR /home/alexander/dotfiles
RUN chown -R alexander: /home/alexander/
USER alexander

RUN ./first_time.sh
