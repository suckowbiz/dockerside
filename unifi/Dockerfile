FROM suckowbiz/base

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

# Unifiy currently requires mongodb 3.4
# https://community.ui.com/releases/UniFi-Network-Controller-5-12-35/45726736-ee4c-4172-877a-a2303f5d3627
ENV VERSION_UNIFY=5.12.35 \
    VERSION_MONGODB_ORG_SERVER_MAJOR_MINOR=3.4 \
    VERSION_MONGODB_ORG_SERVER_PATCH=23
ENV UNIFY_DOWNLOAD_ROOT=https://dl.ui.com/unifi/${VERSION_UNIFY}/unifi_sysvinit_all.deb

RUN apt-get update --quiet \
 && apt-get install --yes curl
# Provide mongodb as a requirement to unifi network controller
RUN curl \
    --fail \
    --insecure \
    --location \
    --remote-name \
    --show-error \
    https://repo.mongodb.org/apt/ubuntu/dists/xenial/mongodb-org/${VERSION_MONGODB_ORG_SERVER_MAJOR_MINOR}/multiverse/binary-amd64/mongodb-org-server_${VERSION_MONGODB_ORG_SERVER_MAJOR_MINOR}.${VERSION_MONGODB_ORG_SERVER_PATCH}_amd64.deb \
  && apt-get install --quiet --quiet ./mongodb-org-server_${VERSION_MONGODB_ORG_SERVER_MAJOR_MINOR}.${VERSION_MONGODB_ORG_SERVER_PATCH}_amd64.deb \
  && rm --force ./mongodb-org-server_${VERSION_MONGODB_ORG_SERVER_MAJOR_MINOR}.${VERSION_MONGODB_ORG_SERVER_PATCH}_amd64.deb

# Install unifi to provide the binary for execution
RUN curl \
    --fail \
    --insecure \
    --location \
    --remote-name \
    --show-error \
    https://dl.ui.com/unifi/${VERSION_UNIFY}/unifi_sysvinit_all.deb \
 && apt-get install --quiet --quiet ./unifi_sysvinit_all.deb \
 && rm --force ./unifi_sysvinit_all.deb

# HTTP portal redirection
EXPOSE 8880
# HTTPS portal redirection
EXPOSE 8843
# UniFi mobile speed test
EXPOSE 6789
# AP-EDU broadcasting
EXPOSE 5656-5699/udp
# device discovery
EXPOSE 1001/udp
# "Make controller discoverable on L2 network"
EXPOSE 1900/udp
# STUN
EXPOSE 3478/udp
# device and controller communication
EXPOSE 8080
# controller GUI/API as seen in a web browser
EXPOSE 8443
# Remote Access service.
EXPOSE 443/tcp
EXPOSE 443/udp
# Remote Access service
EXPOSE 8883

COPY context /
ENV ENTRYPOINT_AS_ROOT=yes
ENTRYPOINT [ "/entrypoint.sh", "/etc/init.d/unifi", "start" ]