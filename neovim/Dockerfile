FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

RUN apk add --update \
    alpine-sdk \
    linux-headers \
    libtool \
    cmake \
    automake \
    autoconf \
    m4 \
    ncurses-dev \
    python \
    py-pip \
    unzip \
  && rm -rf /var/cache/apk/*

WORKDIR /tmp

RUN git clone https://github.com/neovim/libtermkey.git \
  && cd /tmp/libtermkey \
  && make install \
  && cd /tmp \
  && rm -rf /tmp/libtermkey

RUN git clone https://github.com/neovim/libvterm.git \
  && cd /tmp/libvterm \
  && make install \
  && cd /tmp \
  && rm -rf /tmp/libvterm

RUN git clone https://github.com/neovim/unibilium.git \
  && cd /tmp/unibilium \
  && make \
  && make install \
  && cd /tmp \
  && rm -rf /tmp/unibilium

RUN git clone https://github.com/neovim/neovim.git \
  && cd /tmp/neovim \
  && make \
  && make install \
  && cd /tmp \
  && rm -rf /tmp/neovim

ENTRYPOINT ["nvim"]
