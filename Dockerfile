FROM golang:1.16

ENV DEVELOPMENT=true

# development dependencies
RUN apt-get update && apt-get -y install bzip2 curl git software-properties-common telnet

# datastore dependencies
RUN apt-get update && apt-get -y install default-mysql-client postgresql-client redis-tools

# packaging dependencies
RUN apt-get update && apt-get -y install upx-ucl

# docker
RUN curl -s https://download.docker.com/linux/static/stable/x86_64/docker-18.03.1-ce.tgz | \
  tar -C /usr/bin --strip-components 1 -xz

# node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get update && apt-get install -y nodejs

# watchexec
RUN curl -Ls https://github.com/mattgreen/watchexec/releases/download/1.8.6/watchexec-1.8.6-x86_64-unknown-linux-gnu.tar.gz | \
  tar -C /usr/bin --strip-components 1 -xz
