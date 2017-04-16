FROM ubuntu:16.04

LABEL maintainer=tobias@suckow.biz \
      name=base

ENV DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND=noninteractive \
    KEY_SERVER=hkp://p80.pool.sks-keyservers.net:80 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    VERSION_GOSU=1.10

RUN apt-get --quiet --quiet update \
 && apt-get --quiet --quiet --no-install-recommends upgrade \
 && apt-get --quiet --assume-yes --no-install-recommends install \
    apt-utils \
    # ca-certificates come with curl
    curl \
    dirmngr \
    language-pack-en \
    software-properties-common \
    unzip \
    vim \
    xz-utils

# Set default language to provide a default. Will have effect only after login of user.
RUN locale-gen en_US.UTF-8 \
 && update-locale en_US.UTF-8

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
