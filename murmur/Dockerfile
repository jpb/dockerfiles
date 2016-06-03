FROM alpine:3.3
MAINTAINER Chris Spicer <git@cspicer.net>

RUN apk add --no-cache \
    murmur

ENTRYPOINT ["/usr/bin/murmurd"]
CMD ["-fg", "-help"]
