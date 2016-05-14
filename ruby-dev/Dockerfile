FROM cspicer/dev:alpine
MAINTAINER Chris Spicer

# ruby development tooling
RUN apk add --no-cache \
    ruby \
    ruby-dev

RUN echo 'gem: --no-document' > /etc/gemrc \
  && gem update --system \
  && gem install \
    bundler

VOLUME ["/data"]
ENTRYPOINT ["bash"]

WORKDIR /data

