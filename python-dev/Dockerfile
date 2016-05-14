FROM cspicer/dev:alpine
MAINTAINER Chris Spicer

# python development tooling
RUN apk add --no-cache \
    python \
    python-dev \
    py-pip

RUN pip install --upgrade pip \
  && pip install \
    requests \
    boto3 \
    awscli

VOLUME ["/data"]
ENTRYPOINT ["bash"]

WORKDIR /data

