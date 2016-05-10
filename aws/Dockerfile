FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV AWS_CLI_VERSION 1.10.26

RUN apk add --no-cache \
    python \
    py-pip \ 
    bash \
    make \
  && pip install --upgrade pip \
  && pip install \
    boto3 \
    awscli==${AWS_CLI_VERSION} \
    aws-shell

ENTRYPOINT ["/usr/bin/aws"]
