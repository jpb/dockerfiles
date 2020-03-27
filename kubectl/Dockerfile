FROM ubuntu:16.04
MAINTAINER James Brennan <james@jamesbrennan.ca>

ENV AWS_CLI_VERSION 1.16.173

RUN apt-get -qq update \
  && apt-get -qq -y install \
    curl \
    groff \
    python-pip \
  && apt-get -qq clean

RUN pip install awscli==${AWS_CLI_VERSION}

ARG KUBE_VERSION="1.13.0"
ARG KUBE_URL_PREFIX="https://storage.googleapis.com/kubernetes-release/release"

RUN curl \
    --location "${KUBE_URL_PREFIX}/v${KUBE_VERSION}/bin/linux/amd64/kubectl" \
    --output /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl

# RUN go get -u -v github.com/kubernetes-sigs/aws-iam-authenticator/cmd/aws-iam-authenticator

RUN curl \
    --location https://storage.googleapis.com/kubernetes-helm/helm-v2.9.0-linux-amd64.tar.gz \
    --output /tmp/helm.tar.gz \
    && cd /tmp \
    && tar -xzf /tmp/helm.tar.gz \
    && cp /tmp/linux-amd64/helm /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && rm /tmp/helm.tar.gz \
    && rm -r /tmp/linux-amd64

ENTRYPOINT ["kubectl"]
