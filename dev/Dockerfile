FROM debian:jessie
MAINTAINER Chris Spicer

ENV TERM screen-256color

ENV GOLANG_VERSION 1.6
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 5470eac05d273c74ff8bac7bef5bad0b5abbd1c4052efbdbc8db45332e836b0b

ENV DOTFILE_REPO https://github.com/cspicer/dotfiles.git
ENV VIM_PLUG_URL "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

RUN echo 'Dpkg::Progress-Fancy "1";' >> /etc/apt/apt.conf.d/99_progressbar \
  && apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    sudo \
    curl \
    less \
    unzip \
    rsync \
    git \
    openssh-client \
    tmux \
    g++ \
    gcc \
    libc6-dev \
    make \
    python-dev \
    python-pip \
    stow \
    vim-nox \
  && apt-get clean -y \
  && apt-get autoclean -y \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

# python dev libraries
RUN pip install --upgrade pip \
  && pip install \
    requests \
    boto3 \
    awscli \
    aws-shell
    
# golang
RUN curl \
    --silent \
    --show-error \
    --create-dirs \
    --location "$GOLANG_DOWNLOAD_URL" \
    --output "/tmp/golang.tar.gz" \
  && echo "$GOLANG_DOWNLOAD_SHA256 /tmp/golang.tar.gz" | sha256sum -c - \
  && tar -C /usr/local -xzf /tmp/golang.tar.gz \
  && rm /tmp/golang.tar.gz

# docker client
RUN curl \
    --silent \
    --show-error \
    --create-dirs \
    --location "https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz" \
    --output "/tmp/docker.tar.gz" \
  && tar -C /usr/local/bin -xzf /tmp/docker.tar.gz --strip 1 \
  && rm /tmp/docker.tar.gz

ENV GOPATH /data/dev/go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

# dotfiles
RUN git clone \
    "$DOTFILE_REPO" \
    /root/.dotfiles \
  && cd /root/.dotfiles \
  && for file in $(ls /root/.dotfiles); \
      do stow $file; \
    done

# editor configuration 
RUN curl \
    --silent \
    --show-error \
    --create-dirs \
    --location "$VIM_PLUG_URL" \
    --output "$HOME/.vim/autoload/plug.vim" \
  && vim -c "PlugInstall | qa!" > /dev/null # redirect output from vim to null

WORKDIR "/root"
ENTRYPOINT ["bash"]

