FROM suckowbiz/base
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

# Sources:
# https://help.ui.com/hc/en-us/articles/220066768-UniFi-How-to-Install-Update-via-APT-on-Debian-or-Ubuntu

# New Releases appear here (listed as "UniFi Network Application"): https://community.ui.com/releases
ARG VERSION_UNIFI=7.5.*

# Add gpg key to be able to trustfully update from the to be added repository
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50 \
 && add-apt-repository 'deb [trusted=yes] https://www.ui.com/downloads/unifi/debian stable ubiquiti'

RUN apt-get update \
 && apt-get install --quiet --quiet \
    openjdk-11-jre-headless \
    supervisor \
    unifi=${VERSION_UNIFI}

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
ENTRYPOINT [ "supervisord" ]
