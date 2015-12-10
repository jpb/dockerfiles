FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

RUN apk add --update \
    python \
    py-pip \ 
  && pip install --upgrade pip \
  && pip install awscli
 
RUN rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/aws"]
