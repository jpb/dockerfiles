FROM anapsix/alpine-java:8
MAINTAINER James Brennan <james@jamesbrennan.ca>

ENV LEIN_ROOT=1

RUN apk add --update \
    curl \
    bash \
  && rm -rf /var/cache/apk/*

RUN curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > /usr/local/bin/lein

RUN chmod +x /usr/local/bin/lein

RUN lein --version

ENTRYPOINT ["lein"]
