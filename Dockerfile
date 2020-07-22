ARG VERSION=0.7.4
ARG ARCHITECTURE=amd64
ARG DOWNLOAD_URL https://github.com/Jeremie-C/docker-gen/releases/download/$VERSION/docker-gen-alpine-linux-$ARCHITECTURE-$VERSION.tar.gz

FROM alpine:latest
LABEL maintainer="Jeremie-C <Jeremie-C@users.noreply.github.com>"
LABEL oldmaintainer="Jason Wilder <mail@jasonwilder.com>"
LABEL version=$VERSION

RUN apk -U add openssl
RUN wget -qO- $DOWNLOAD_URL | tar xvz -C /usr/local/bin

ENV DOCKER_HOST unix:///tmp/docker.sock

ENTRYPOINT ["/usr/local/bin/docker-gen"]
