FROM ubuntu:16.04

RUN apt-get update -qq \
  && apt-get --no-install-recommends -y install \
    emacs \
    bash \
  && apt-get clean -y \
  && apt-get autoclean -y \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/syl20bnr/spacemacs.git /root/.emacs.d \
    && git --git-dir /root/.emacs.d/.git checkout 7bdde17

RUN git clone https://github.com/Bash-it/bash.git /root/.bash-it \
    && git --git-dir /root/.bash-it/.git checkout 7ffb9e2

RUN git clone https://github.com/jpb/dotfiles.git /root/.dotfiles \
    && git --git-dir /root/.dotfiles/.git checkout 8084e11

RUN cd /root/.dotfiles && \
    stow emacs \
         git \
         tmux \
         bash

COPY bin /root/bin

ENV TERM screen-256color
ENV LANG en_US.UTF-8
ENV PATH /root/bin:$PATH
ENV SHELL /bin/bash
ENV EMACS_SERVER_FILE /tmp/emacs-docker/server.sock
ENV ALTERNATE_EDITOR emacs
ENV EDITOR emacsclient

ENTRYPOINT ["emacs", "-s", "/tmp/emacs-docker/server.sock"]