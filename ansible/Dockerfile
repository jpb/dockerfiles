FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV ANSIBLE_VERSION 2.0.0-0.5.beta3

RUN apk add --update \
    build-base \
    python \
    python-dev \
    py-pip \ 
  && pip install --upgrade pip \
  && pip install \
    http://releases.ansible.com/ansible/ansible-${ANSIBLE_VERSION}.tar.gz \
    requests \
    docker-py \
    boto \
    dopy \
    dnsimple
 
RUN rm -rf /var/cache/apk/* \

ENTRYPOINT ["/usr/local/bin/ansible"]
