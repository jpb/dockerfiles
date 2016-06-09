FROM alpine:3.3
MAINTAINER Chris Spicer <git@cspicer.net>

ENV ANSIBLE_VERSION 2.1.0.0
ENV ANSIBLE_ARTIFACT_URL https://releases.ansible.com/ansible/ansible-${ANSIBLE_VERSION}.tar.gz

RUN apk add --no-cache \
    build-base \
    libffi-dev \
    python \
    python-dev \
    py-pip \ 
    openssl-dev \
    openssh-client \
    git

RUN pip install --upgrade pip \
  && pip install \
    ${ANSIBLE_ARTIFACT_URL} \
    docker-py \
    boto \
    boto3

ENTRYPOINT ["ansible"]
CMD ["--help"]
