FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

RUN apk add --update \
    python \
    py-pip \ 
  && pip install --upgrade pip \
  && pip install \
    boto3 \
    awscli \
    aws-shell \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/aws"]
