FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV ANSIBLE_VERSION 1.9.4

RUN apk add --update \
    build-base \
    bash \
    openssh-client \
    python \
    python-dev \
    py-pip \ 
    git \
  && pip install --upgrade pip \
  && pip install \
    http://releases.ansible.com/ansible/ansible-${ANSIBLE_VERSION}.tar.gz \
    requests \
    docker-py \
    boto \
    dopy \
    dnsimple
 
RUN rm -rf /var/cache/apk/* \

CMD ["/usr/local/bin/ansible"]
