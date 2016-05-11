FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

RUN apk add --no-cache \
    murmur

ENTRYPOINT ["/usr/bin/murmurd"]
CMD ["-fg", "-help"]
