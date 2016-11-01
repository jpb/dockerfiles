FROM jamesbrennan/base
MAINTAINER James Brennan <james@jamesbrennan.ca>

# Install rbenv
RUN apk add --no-cache bash
RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv
RUN cd /root/.rbenv && git fetch && git checkout v1.0.0
RUN apk add --no-cache --virtual .build-deps
RUN cd /root/.rbenv && src/configure && make -C src
RUN apk del .build-deps
RUN echo 'gem: --no-document' > /etc/gemrc

RUN apk add --no-cache linux-headers openssl
RUN wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
RUN tar -xzvf ruby-install-0.6.0.tar.gz
RUN cd ruby-install-0.6.0/ && make install
RUN rm -r ruby-install-0.6.0

# Install ruby-build
# RUN git clone https://github.com/rbenv/ruby-build.git /root/ruby-build
# RUN cd /root/ruby-build && git fetch && git checkout v20160913
# RUN cd /root/ruby-build && ./install.sh
# RUN rm -r /root/ruby-build

ENV PATH /root/.rbenv/bin:/root/.rbenv/shims:$PATH

VOLUME ["/root/.rbenv"]

ENTRYPOINT /bin/bash