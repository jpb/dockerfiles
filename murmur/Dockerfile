FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

RUN apk add --update \
    murmur \
  && rm -rf /var/cache/apk/*

CMD ["/usr/bin/murmurd", "-fg", "-help"]
