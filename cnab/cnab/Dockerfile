FROM alpine:latest

ENV HELM_LATEST_VERSION="v2.9.1"

# Add kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/v1.6.4/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

# install helm and azure-cli
RUN apk add --update ca-certificates \
 && apk add --update -t deps wget \
 && wget https://storage.googleapis.com/kubernetes-helm/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -f /helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && apk add bash py-pip \
 && apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make \
 && pip install --upgrade pip \
 && pip install azure-cli \
 && apk del --purge deps \
 && rm /var/cache/apk/*

COPY Dockerfile /cnab/Dockerfile
COPY app /cnab/app

CMD ["/cnab/app/run"]
