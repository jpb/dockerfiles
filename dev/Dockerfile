FROM ubuntu:18.04
MAINTAINER James Brennan <james@jamesbrennan.ca>

# ENV TERM xterm-256color
# ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US:en
# ENV LC_ALL en_US.UTF-8
ENV TERM screen-256color
ENV LANG en_US.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get -y install software-properties-common \
  && add-apt-repository ppa:git-core/ppa \
  && apt-get update \
  && apt-get -y install \
    bash-completion \
    curl \
    default-jdk \
    dnsutils \
    git \
    ispell \
    jq \
    libffi-dev \
    libsqlite3-dev \
    make \
    man \
    mysql-client \
    netcat \
    python \
    python-openssl \
    python-pip \
    silversearcher-ag \
    software-properties-common \
    stow \
    tmux \
    wget \
    zlib1g-dev \
    zsh \
    zip \
  && add-apt-repository ppa:ubuntu-elisp/ppa \
  && add-apt-repository ppa:brightbox/ruby-ng \
  && apt-get update \
  && apt-get -y install \
    emacs-snapshot \
    ruby2.4 \
    ruby2.4-dev \
  && apt-get clean

RUN gem install bundler

# lein
RUN curl -L "https://raw.githubusercontent.com/technomancy/leiningen/2.9.1/bin/lein" -o /usr/local/bin/lein \
  && chmod +x /usr/local/bin/lein \
  && lein

# bats
RUN git clone --depth 1 https://github.com/sstephenson/bats.git /tmp/bats \
  && /tmp/bats/install.sh /usr/local \
  && rm -rf /tmp/bats

# RUN LC_ALL=C pip install --upgrade pip
# RUN LC_ALL=C pip install ansible boto boto3 yamllint jedi

# Docker Client

RUN curl \
    --silent \
    --show-error \
    --create-dirs \
    --location "https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz" \
    --output "/tmp/docker.tar.gz" \
  && tar -C /usr/local/bin -xzf /tmp/docker.tar.gz --strip-components 1 \
  && rm /tmp/docker.tar.gz

# Docker Compose

RUN curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose

# kubectl

RUN curl -L "https://storage.googleapis.com/kubernetes-release/release/v1.5.4/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl

# nodejs
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get install -y nodejs

RUN npm install -g \
  yarn \
  typescript \
  typescript-formatter \
  tslint \
  tern

RUN yarn global add \
  elm \
  elm-format

# Go
ENV PATH=$PATH:/usr/local/go/bin:/root/projects/go/bin
ENV GOBIN=/usr/local/go/bin

RUN wget --quiet -O go.tgz "https://golang.org/dl/go1.12.linux-amd64.tar.gz" \
  && tar -C /usr/local -xzf go.tgz \
  && rm go.tgz \
  && curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh \
  && go version \
  && go get -u -v github.com/nsf/gocode \
  && go get -u -v github.com/rogpeppe/godef \
  && go get -u -v golang.org/x/tools/cmd/guru \
  && go get -u -v golang.org/x/tools/cmd/gorename \
  && go get -u -v golang.org/x/tools/cmd/goimports \
  && go get -u -v github.com/kisielk/errcheck

# Dotfiles

RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

RUN git clone -b v0.200.13 https://github.com/syl20bnr/spacemacs.git ~/.emacs.d

RUN git clone https://github.com/jpb/dotfiles.git /root/.dotfiles

RUN cd /root/.dotfiles \
   && stow emacs \
           git \
           tmux \
           zsh \
   && chsh -s /usr/bin/zsh

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
  && ~/.fzf/install --all

RUN emacs -nw -batch -u root -q -kill
    # && \
    # sed -i "s/dotspacemacs-install-packages 'all/dotspacemacs-install-packages 'used-but-keep-unused/g" \
    #   ${HOME}/.spacemacs && \
    # emacs -nw -batch -u root -q -kill

COPY bin /root/bin

ENV PATH=/root/bin:$PATH
ENV SHELL=/bin/zsh

ENTRYPOINT ["tmux"]
CMD ["-u", "new", "-s", "dev"]
