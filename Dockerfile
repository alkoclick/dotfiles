# 22.04 digest
FROM ubuntu@sha256:89d243610a4bb0b4b00bb7179fc6135bed3f70236b31b72eb477d9770c08acf5

# Base dependencies that would otherwise exist in a normal Ubuntu system
RUN apt-get update \
  &&\
  apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    sudo \
  &&\
  rm -rf /var/lib/apt/lists/*

COPY . dotfiles

# This includes all our own deps
RUN apt-get update \
  &&\
  cd dotfiles \
  &&\
  ./ubuntu_deps.sh \
  &&\
  ./install.sh \
    &&\
  rm -rf /var/lib/apt/lists/*
