FROM alpine:3.4
MAINTAINER Chris Spicer <git@cspicer.net>

ENV LIVESTREAMER_VERSION 1.12.2

RUN apk add --no-cache \
    python \
    py-pip

RUN pip install --upgrade pip \
  && pip install \
    livestreamer==${LIVESTREAMER_VERSION}

ENTRYPOINT ["livestreamer"]
CMD ["--help"]

