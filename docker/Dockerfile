FROM debian:buster

RUN apt-get update \
    && apt-get install -y \
      apt-transport-https \
      bash \
      bash-completion \
      ca-certificates \
      curl \
      dnsutils \
      git \
      gnupg \
      gnupg2 \
      jq \
      net-tools \
      openssl \
      procps \
      python \
      unzip \
      wget

ENV KUBECTL_VERSION=1.18
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update \
    && apt-get install -y kubectl

# Terraform / GCloud sdk
WORKDIR /tmp
ENV TERRAFORM_VERSION=0.14.4
ENV TF_DEV=true
ENV TF_RELEASE=true
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    wget https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip -O /tmp/google-cloud-sdk.zip && \
    cd /usr/local && unzip /tmp/google-cloud-sdk.zip && \
    google-cloud-sdk/install.sh --usage-reporting=false --path-update=true --bash-completion=true && \
    google-cloud-sdk/bin/gcloud config set --installation component_manager/disable_update_check true && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*
ENV PATH = $PATH:/usr/local/google-cloud-sdk/bin/

COPY files/root/.bashrc /root/.bashrc

VOLUME [ "/data" ]
WORKDIR /data/tf

CMD ["tail", "-f", "/dev/null"]
