FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

RUN apk add --update \
    vim \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["vim"]
