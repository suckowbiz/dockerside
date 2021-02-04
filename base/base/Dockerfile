FROM quay.io/baselibrary/ubuntu:20.04
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ARG VERSION_GOSU=1.11

# Avoid selection dialogs such as required when run `dpkg-reconfigure locales` by setting Debian globals.
ENV LANG=C.UTF-8 \
    KEY_SERVER="hkp://keyserver.ubuntu.com:80" \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND=noninteractive \
    # Avoid: "Warning: apt-key output should not be parsed (stdout is not a terminal)"
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=any-value

# Avoid "debconf: delaying package configuration, since apt-utils is not installed" by installing apt-utils first. 
RUN apt-get update --quiet --quiet \
 && apt-get install --quiet --quiet --no-install-recommends \
    apt-utils \
    language-pack-en-base

# Setting locales must happen after installation of language-pack-en since it 
# generates and configurates locales first and avoids:
# /bin/bash: warning: setlocale: LC_ALL: cannot change locale 
ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

RUN apt-get install --quiet --quiet --no-install-recommends \
    curl \
    dirmngr \
    gnupg-agent \
    software-properties-common \
    unzip \
    xz-utils

# Install gosu to use it for command execution as appropriate user in entrypoint.sh
WORKDIR /usr/bin
RUN curl \
    --fail \
    --location \
    --show-error \
    --remote-name \
    https://github.com/tianon/gosu/releases/download/${VERSION_GOSU}/gosu-amd64{,.asc} \
 && gpg --batch --keyserver "${KEY_SERVER}" --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
 && gpg --batch --verify gosu-amd64.asc gosu-amd64 \
 && rm --force gosu-amd64.asc \
 && mv gosu-amd64 gosu \
 && chown root gosu \
 && chmod +sx gosu

COPY context /
