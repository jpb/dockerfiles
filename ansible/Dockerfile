FROM alpine:3.3
MAINTAINER Chris Spicer <git@cspicer.net>

ENV ANSIBLE_VERSION 2.1.0.0

RUN apk add --no-cache \
    python \
    python-dev \
    py-pip \ 
    openssh-client \
    git

RUN pip install --upgrade pip \
  && pip install \
    http://releases.ansible.com/ansible/ansible-${ANSIBLE_VERSION}.tar.gz \
    awscli \
    requests \
    docker-py \
    boto \
    dopy \
    dnsimple

ENTRYPOINT ["ansible"]
CMD ["--help"]
