FROM alpine:3.3
MAINTAINER Chris Spicer <git@cspicer.net>

ENV YOUTUBE_DL_VERSION 2016.05.30.2

RUN apk add --no-cache \
    ca-certificates \
    python \
    py-pip \
    ffmpeg

RUN pip install --upgrade pip \
  && pip install \
    youtube-dl==${YOUTUBE_DL_VERSION}

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]

