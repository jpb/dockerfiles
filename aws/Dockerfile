FROM jamesbrennan/base
MAINTAINER James Brennan <james@jamesbrennan.ca>

ENV AWS_CLI_VERSION 1.10.38

RUN apk add --no-cache \
    groff \
    python \
    py-pip \
  && pip install --upgrade pip \
  && pip install \
    boto3 \
    awscli==${AWS_CLI_VERSION} \
    aws-shell

ENTRYPOINT ["/usr/bin/aws"]
