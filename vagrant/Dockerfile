FROM debian:jessie
MAINTAINER Chris Spicer

ENV VAGRANT_VERSION 1.8.1
ENV VAGRANT_PKG_URL https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb
ENV VAGRANT_PKG_SHA256 ed0e1ae0f35aecd47e0b3dfb486a230984a08ceda3b371486add4d42714a693d
ENV VAGRANT_DUMMY_BOX_URL https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box

ENV VAGRANT_DEFAULT_PROVIDER aws

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    openssh-client \
  && apt-get clean -y \
  && apt-get autoclean -y \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

RUN curl \
    --silent \
    --show-error \
    --create-dirs \
    --location "${VAGRANT_PKG_URL}" \
    --output "/tmp/vagrant.deb" \
  && echo "${VAGRANT_PKG_SHA256} /tmp/vagrant.deb" | sha256sum -c - \
  && dpkg -i /tmp/vagrant.deb \
  && rm /tmp/vagrant.deb

RUN vagrant plugin install vagrant-aws \
  && vagrant box add dummy ${VAGRANT_DUMMY_BOX_URL}

ENTRYPOINT ["vagrant"]

