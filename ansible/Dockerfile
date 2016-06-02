FROM alpine:3.3
MAINTAINER Chris Spicer <git@cspicer.net>

ENV ANSIBLE_VERSION 2.1.0.0
ENV ANSIBLE_ARTIFACT_URL https://releases.ansible.com/ansible/ansible-${ANSIBLE_VERSION}.tar.gz

RUN apk add --no-cache \
    python \
    python-dev \
    py-pip \ 
    openssh-client \
    git

RUN pip install --upgrade pip \
  && pip install \
    ${ANSIBLE_ARTIFACT_URL} \
    docker-py \
    boto

ENTRYPOINT ["ansible"]
CMD ["--help"]
