FROM debian:buster

RUN apt-get update \
    && apt-get install -y \
      apt-transport-https \
      bash \
      bash-completion \
      ca-certificates \
      curl \
      dnsutils \
      gcc \
      git \
      gnupg \
      gnupg2 \
      jq \
      net-tools \
      openssl \
      procps \
      python \
      software-properties-common \
      unzip \
      wget

WORKDIR /tmp

# yq
ENV YQ_VERSION="3.4.1"
RUN wget -q https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -O /usr/bin/yq \
    && chmod +x /usr/bin/yq

# kubectl
RUN wget -q https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl -O /usr/bin/kubectl \
    && chmod +x /usr/bin/kubectl

# Terraform / GCloud sdk
ENV TERRAFORM_VERSION=0.14.4
ENV TF_DEV=true
ENV TF_RELEASE=true
RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip -q terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

RUN wget -q https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -O awscliv2.zip \
    && unzip -q awscliv2.zip \
    && ./aws/install

RUN wget -q https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip -O /tmp/google-cloud-sdk.zip && \
    cd /usr/local &&  \
    unzip -q /tmp/google-cloud-sdk.zip && \
    google-cloud-sdk/install.sh --usage-reporting=false --path-update=true --bash-completion=true && \
    google-cloud-sdk/bin/gcloud config set --installation component_manager/disable_update_check true && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*
ENV PATH = $PATH:/usr/local/google-cloud-sdk/bin/

# Go lang
ENV GO_VERSION="1.16.2"
RUN wget -q https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz -O go.tar.gz \
    && tar xf go.tar.gz \
    && mv go /usr/local
ENV GOPATH=/data
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

COPY files/root/* /root/

VOLUME [ "/data" ]
WORKDIR /data

ENV GOPATH=/root
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

CMD ["tail", "-f", "/dev/null"]
