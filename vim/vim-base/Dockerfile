FROM debian:jessie
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV TERM screen-256color

RUN apt-get update -qq \
  && apt-get install -y \
    vim-nox \
  && apt-get clean -y \
  && apt-get autoclean -y \
  && apt-get autoremove -y

ENTRYPOINT ["vim"]

