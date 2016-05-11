FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV YOUTUBE_DL_VERSION 2016.05.10

RUN apk add --no-cache \
    ca-certificates \
    python \
    py-pip \
    ffmpeg \
  && pip install --upgrade pip \
  && pip install \
    youtube-dl==${YOUTUBE_DL_VERSION}

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]
