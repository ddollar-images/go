FROM golang:1.17

ENV DEVELOPMENT=true

# development dependencies
RUN apt-get update && apt-get -y install bzip2 curl git software-properties-common telnet xz-utils

# datastore dependencies
RUN apt-get update && apt-get -y install default-mysql-client postgresql-client redis-tools

# packaging dependencies
RUN apt-get update && apt-get -y install upx-ucl

# docker
RUN curl -s https://download.docker.com/linux/static/stable/x86_64/docker-20.10.7.tgz | \
  tar -C /usr/bin --strip-components 1 -xz

# node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get update && apt-get install -y nodejs

# watchexec
RUN curl -Ls https://github.com/watchexec/watchexec/releases/download/cli-v1.17.1/watchexec-1.17.1-x86_64-unknown-linux-gnu.tar.xz | \
  tar -C /usr/bin --strip-components 1 -xJ
