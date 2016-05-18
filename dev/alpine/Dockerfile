FROM alpine:latest
MAINTAINER Chris Spicer

ENV DOTFILE_REPO https://github.com/cspicer/dotfiles.git

RUN apk add --no-cache \
    tar \
    curl \
    less \
    unzip \
    rsync \
    bash \
    bash-completion \
    util-linux \
    coreutils \
    findutils \
    grep \
    git \
    git-bash-completion \
    openssh-client \
    tmux \
    tmux-bash-completion \
    tmux-vim \
    make \
    jq

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

# dotfiles
RUN git clone "$DOTFILE_REPO" /root/.dotfiles \
  && cd /root/.dotfiles \
  && for file in $(ls /root/.dotfiles); \
      do stow $file; \
    done

VOLUME ["/data"]
WORKDIR /data
ENTRYPOINT ["bash"]

