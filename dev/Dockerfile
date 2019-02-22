FROM ubuntu:16.04
MAINTAINER James Brennan <james@jamesbrennan.ca>

# ENV TERM xterm-256color
# ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US:en
# ENV LC_ALL en_US.UTF-8
ENV TERM screen-256color
ENV LANG en_US.UTF-8

RUN apt-get update \
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
    python-software-properties  \
    silversearcher-ag \
    software-properties-common \
    stow \
    tmux \
    wget \
    zlib1g-dev \
    zsh \
  && add-apt-repository ppa:kelleyk/emacs \
  && add-apt-repository ppa:brightbox/ruby-ng \
  && apt-get update \
  && apt-get -y install \
    emacs25 \
    ruby2.4 \
    ruby2.4-dev \
  && apt-get clean

RUN gem install bundler

# lein
RUN curl -L "https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein" -o /usr/local/bin/lein \
  && chmod +x /usr/local/bin/lein \
  && lein

# bats
RUN git clone --depth 1 https://github.com/sstephenson/bats.git /tmp/bats \
  && /tmp/bats/install.sh /usr/local \
  && rm -rf /tmp/bats

RUN LC_ALL=C pip install --upgrade pip
RUN LC_ALL=C pip install ansible boto boto3 yamllint jedi

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

RUN curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose

# kubectl

RUN curl -L "https://storage.googleapis.com/kubernetes-release/release/v1.5.4/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl

# nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - \
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

# Dotfiles

RUN ls -al

RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

RUN git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d && echo c7a103a

RUN git clone https://github.com/jpb/dotfiles.git /root/.dotfiles && echo 420340b

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
