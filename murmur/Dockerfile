FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

RUN apk add --update \
    murmur \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/murmurd"]
CMD ["-fg", "-help"]
