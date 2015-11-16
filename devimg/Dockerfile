FROM debian:jessie

MAINTAINER Chris Spicer

ENV \
  ANSIBLE_VERSION=2.0.0-0.3.beta1 \
  TERRAFORM_VERSION=0.6.4 \
  PACKER_VERSION=0.8.6 \
  VAGRANT_VERSION=1.7.4 \
  GOLANG_VERSION=1.5.1

RUN apt-get update -qq -y && apt-get install -y \
  sudo \
  git \
  curl \
  wget \
  rsync \
  vim \
  tmux \
  unzip \
  build-essential

# install python
RUN apt-get install -y \
  python \
  python-pip \
  python-dev

# install golang
RUN curl -s -L \
  https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz | tar -C /usr/local -zx
ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:$PATH

# install ansible + libraries
RUN pip install \
  http://releases.ansible.com/ansible/ansible-${ANSIBLE_VERSION}.tar.gz \
  requests \
  docker-py \
  boto \
  dopy \
  dnsimple
RUN mkdir -p /etc/ansible/ 
RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts

# install awscli
RUN pip install awscli

# install terraform
RUN curl -s -L -O \
  https://dl.bintray.com/mitchellh/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /tmp/terraform \
  && cp -R /tmp/terraform/* /usr/local/bin \
  && rm -rf terraform_${TERRAFORM_VERSION}_linux_amd64.zip /tmp/terraform

# install packer
RUN curl -s -L -O \
  https://dl.bintray.com/mitchellh/packer/packer_${PACKER_VERSION}_linux_amd64.zip
RUN unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /tmp/packer \
  && cp -R /tmp/packer/* /usr/local/bin \
  && rm -rf packer_${PACKER_VERSION}_linux_amd64.zip /tmp/packer

# install vagrant
RUN curl -s -L -O \
  https://dl.bintray.com/mitchellh/vagrant/vagrant_${VAGRANT_VERSION}_x86_64.deb
RUN dpkg -i vagrant_${VAGRANT_VERSION}_x86_64.deb \
  && rm vagrant_${VAGRANT_VERSION}_x86_64.deb

# cleanup
#RUN apt-get remove -y --purge \
#  build-essential \
#  python-dev
RUN apt-get autoremove -y && apt-get clean -y
RUN rm -rf /var/lib/apt/lists/* \
  /tmp/* \
  /var/tmp/*
