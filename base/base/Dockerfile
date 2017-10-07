FROM ubuntu:17.04

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND=noninteractive \
    KEY_SERVER="hkp://keyserver.ubuntu.com:80" \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    VERSION_GOSU=1.10

RUN apt-get update --quiet \
 && apt-get install --assume-yes --no-install-recommends --quiet\
    apt-utils \
    # ca-certificates come with curl
    curl \
    dirmngr \
    language-pack-en \
    software-properties-common \
    unzip \
    xz-utils

# Set default language to provide a default. Will have effect only after login of user.
RUN locale-gen en_US.UTF-8 \
 && update-locale en_US.UTF-8

# Install gosu to use it for command execution as appropriate user in entrypoint.sh
WORKDIR /usr/bin
RUN curl \
        --fail \
        --location \
        --show-error \
        --remote-name \
        https://github.com/tianon/gosu/releases/download/${VERSION_GOSU}/gosu-amd64{,.asc} \
 && gpg --keyserver "${KEY_SERVER}" --recv-keys BF357DD4 \
 && gpg --verify gosu-amd64.asc gosu-amd64 \
 && rm --force gosu-amd64.asc \
 && mv gosu-amd64 gosu \
 && chown root gosu \
 && chmod +sx gosu

COPY context /
