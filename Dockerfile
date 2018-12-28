FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install -y git \
  libxml2-dev \
  libxslt1-dev \
  python-dev \
  libcurl4-openssl-dev \
  wget \
  zip \
  make \
  g++ \
  xz-utils

ENV NODE_VERSION="v8.9.3"

RUN wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz
RUN xz -dv node-${NODE_VERSION}-linux-x64.tar.xz
RUN tar xfv node-${NODE_VERSION}-linux-x64.tar
RUN mv node-${NODE_VERSION}-linux-x64 node
ENV PATH $PWD/node/bin:"${PATH}"

RUN npm i -g serverless

ENTRYPOINT [ "serverless" ]