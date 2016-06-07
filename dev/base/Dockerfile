FROM alpine:3.3
MAINTAINER Chris Spicer

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
    build-base \
    make \
    jq

# python development
RUN apk add --no-cache \
    python \
    python-dev \
    py-pip

RUN pip install --upgrade pip \
  && pip install \
    requests \
    boto3 \
    awscli

# ruby development
RUN apk add --no-cache \
    ruby \
    ruby-dev

RUN echo 'gem: --no-document' > /etc/gemrc \
  && gem update --system \
  && gem install \
    bundler

# lua development
RUN apk add --no-cache \
    lua \
    lua-dev \
  && apk add --no-cache \
    --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    luarocks

RUN apk add --no-cache --virtual build-deps \
    build-base \
    musl-dev \
  && luarocks-5.1 install \
    moonscript \
  && apk del build-deps


ENTRYPOINT ["bash"]

