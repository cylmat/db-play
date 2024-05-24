##############
# Build with docker:
#   build --pull --rm -f ".docker\Dockerfile" -t dbplay:latest ".docker" 
#############

FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update

### Common and build (https://packages.debian.org) ###

#########
# SHELL #
#########
RUN apt install -y busybox curl git wget zsh zip

# EXT #
RUN apt install -y build-essential gcc make
RUN apt install -y pkg-config software-properties-common
RUN apt install -y --no-install-recommends python3 sqlite3 vim
RUN apt install -y \
    apt-utils \
    autoconf \
    bzip2 \
    gnupg \
    libc6-dev \
    net-tools

#########
# PANEL #
#########
# RUN curl https://raw.githubusercontent.com/ajenti/ajenti/master/scripts/install.sh | bash -s -

#########
# NIXOS #
# https://nixos.org
#########

#############
### Clean ###
#############
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
