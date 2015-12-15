FROM debian:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

RUN apt-get update -qq \
  && apt-get --no-install-recommends -y install \
    cabal-install \
    ghc \
  && apt-get clean -y \
  && apt-get autoclean -y \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

ENV LANG=C.UTF-8
RUN cabal update \
  && cabal install --global \
    shellcheck

ENTRYPOINT ["shellcheck"]
