FROM golang
MAINTAINER James Brennan <james@jamesbrennan.ca>

ARG KUBE_VERSION="1.10.0"
ARG KUBE_URL_PREFIX="https://storage.googleapis.com/kubernetes-release/release"

RUN curl \
    --location "${KUBE_URL_PREFIX}/v${KUBE_VERSION}/bin/linux/amd64/kubectl" \
    --output /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl

RUN go get -u -v github.com/kubernetes-sigs/aws-iam-authenticator/cmd/aws-iam-authenticator

RUN curl \
    --location https://storage.googleapis.com/kubernetes-helm/helm-v2.9.0-linux-amd64.tar.gz \
    --output /tmp/helm.tar.gz \
    && cd /tmp \
    && tar -xzf /tmp/helm.tar.gz \
    && cp /tmp/linux-amd64/helm /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && rm /tmp/helm.tar.gz \
    && rm -r /tmp/linux-amd64

RUN curl -L https://git.io/getIstio | sh -

ENTRYPOINT ["kubectl"]
