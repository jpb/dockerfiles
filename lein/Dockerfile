FROM frolvlad/alpine-oraclejdk8:slim
MAINTAINER James Brennan <james@jamesbrennan.ca>

ENV LEIN_ROOT=1

RUN apk add --no-cache --update \
    curl \
    bash \
  && rm -rf /var/cache/apk/*

RUN curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > /usr/local/bin/lein \
  && chmod +x /usr/local/bin/lein \ 
  && lein --version

ENTRYPOINT ["lein"]
