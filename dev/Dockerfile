FROM jamesbrennan/base
MAINTAINER James Brennan <james@jamesbrennan.ca>

# docker client
RUN curl \
    --silent \
    --show-error \
    --create-dirs \
    --location "https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz" \
    --output "/tmp/docker.tar.gz" \
  && tar -C /usr/local/bin -xzf /tmp/docker.tar.gz --strip-components 1 \
  && rm /tmp/docker.tar.gz \
  && apk add --no-cache \
    docker-bash-completion

# gnu stow
RUN apk add --no-cache \
    perl \
  && apk add --no-cache --virtual \
    build-deps \
    automake \
  && curl \
    --silent \
    --show-error \
    --create-dirs \
    --location "http://ftp.gnu.org/gnu/stow/stow-2.2.2.tar.gz" \
    --output "/tmp/stow.tar.gz" \
  && mkdir -p /usr/local/src/stow \
  && tar -C /usr/local/src/stow -xzf /tmp/stow.tar.gz --strip-components 1 \
  && cd /usr/local/src/stow \
  && ./configure \
  && make install \
  && rm -rf /usr/local/src/stow \
  && rm /tmp/stow.tar.gz \
  && apk del build-deps

RUN git clone https://github.com/Bash-it/bash-it.git ~/.bash-it \
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

ENTRYPOINT ["tmux"]
CMD ["new", "-s", "dev"]