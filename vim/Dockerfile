FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV TERM screen-256color

RUN apk add --update \
    vim \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["vim"]
