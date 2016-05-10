FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV YOUTUBE_DL_VERSION 2016.01.01

RUN apk add --update \
    ca-certificates \
    python \
    py-pip \
    ffmpeg \
  && pip install --upgrade pip \
  && pip install \
    youtube-dl==${YOUTUBE_DL_VERSION} \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]
