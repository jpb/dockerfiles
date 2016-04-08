FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV AWS_CLI_VERSION 1.10.19

RUN apk add --update \
    python \
    py-pip \ 
    bash \
    make \
  && pip install --upgrade pip \
  && pip install \
    boto3 \
    awscli==${AWS_CLI_VERSION} \
    aws-shell \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/aws"]
