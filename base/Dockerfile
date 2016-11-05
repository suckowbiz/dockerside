FROM ubuntu:16.04

MAINTAINER Tobias Suckow <tobias@suckow.biz>

ENV DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND=noninteractive \
    KEY_SERVER=hkp://p80.pool.sks-keyservers.net:80 \
    VERSION_GOSU=1.10

# Set default language to satisfy (debconf) xorg.
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN apt-get --quiet --quiet update \
 && apt-get --quiet --quiet --no-install-recommends --auto-remove upgrade \
 && apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    apt-utils \
    curl \
    dirmngr \
    software-properties-common \
    ca-certificates \
 && update-ca-certificates --fresh

# Install gosu to use it for command execution as appropriate user in entrypoint.sh
WORKDIR /usr/bin
RUN curl -kfLSs -o gosu https://github.com/tianon/gosu/releases/download/$VERSION_GOSU/gosu-amd64 \
 && curl -kfLSs -o gosu.asc https://github.com/tianon/gosu/releases/download/$VERSION_GOSU/gosu-amd64.asc \
 && gpg --keyserver $KEY_SERVER --recv-keys BF357DD4 \
 && gpg --verify gosu.asc gosu \
 && rm -f gosu.asc \
 && chown root gosu \
 && chmod +sx gosu

COPY context /