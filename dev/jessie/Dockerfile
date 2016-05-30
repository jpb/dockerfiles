FROM debian:jessie
MAINTAINER Chris Spicer

ENV TERM screen-256color

ENV GOLANG_VERSION 1.6
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 5470eac05d273c74ff8bac7bef5bad0b5abbd1c4052efbdbc8db45332e836b0b

ENV NEOVIM_VERSION 0.1.4
ENV NEOVIM_ARCHIVE_URL https://github.com/neovim/neovim/archive/v${NEOVIM_VERSION}.tar.gz

ENV DOTFILE_REPO https://gitlab.com/cspicer/dotfiles.git
ENV VIM_PLUG_URL https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ENV XDG_CONFIG_HOME $HOME/.config

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
  && apt-get clean -y \
  && apt-get autoclean -y \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

# neovim
RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config \
  && curl \
    --silent \
    --show-error \
    --create-dirs \
    --location "$NEOVIM_ARCHIVE_URL" \
    --output "/tmp/neovim.tar.gz" \
  && tar -C /usr/local/src/ -xzf /tmp/neovim.tar.gz \
  && cd /usr/local/src/neovim-${NEOVIM_VERSION} \
  && make && make install \
  && rm -rf /usr/local/src/neovim* \ 
  && rm /tmp/neovim.tar.gz \
  && apt-get remove -y \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config

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
RUN rm /root/.profile \
  && git clone \
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
  && mkdir -p "$XDG_CONFIG_HOME" \
  && ln -s ~/.vim "$XDG_CONFIG_HOME/nvim" \
  && ln -s ~/.vimrc "$XDG_CONFIG_HOME/nvim/init.vim" \
  && nvim -c "PlugInstall | qa!"

WORKDIR "/root"
ENTRYPOINT ["bash"]

