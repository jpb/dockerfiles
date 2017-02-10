FROM jamesbrennan/base
MAINTAINER James Brennan <james@jamesbrennan.ca>

ARG RUBY
ARG RUBY_VERSION

RUN echo 'gem: --no-document' > /etc/gemrc

RUN apk add --no-cache linux-headers openssl
RUN wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
RUN tar -xzvf ruby-install-0.6.0.tar.gz
RUN cd ruby-install-0.6.0/ && make install
RUN rm -r ruby-install-0.6.0

RUN apk add --no-cache \
        zlib-dev \
        libxml2-dev \
        libxslt-dev \
        tzdata \
        yaml-dev \
        sqlite-dev \
        postgresql-dev \
        mysql-dev

RUN ruby-install --system $RUBY $RUBY_VERSION

RUN gem install bundler

ENTRYPOINT ["ruby"]