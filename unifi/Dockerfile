FROM suckowbiz/base
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

# Sources:
# https://help.ui.com/hc/en-us/articles/360012282453-UniFi-Self-host-the-Network-Application

# Release Infos: https://community.ui.com/releases/UniFi-Network-Application-7-1-61/06f67c89-c798-423f-91a2-4cb2bca7694d
# New Releases appear here (listed as "UniFi Network Application"): https://community.ui.com/releases
ARG VERSION_UNIFY=7.2.94
ARG UNIFY_DOWNLOAD_ROOT=https://dl.ui.com/unifi/${VERSION_UNIFY}/unifi_sysvinit_all.deb

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN apt-get install --quiet --quiet mongodb openjdk-8-jre

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
