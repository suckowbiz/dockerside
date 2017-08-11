FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

RUN add-apt-repository ppa:jtaylor/keepass
RUN apt-get update --quiet \
 && apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    keepass2

ENV KEEPASS2_HOME=/var/lib/keepass2
ENV KEEPASS2_DATA=${KEEPASS2_HOME}/data \
    KEEPASS2_CONFIG=${KEEPASS2_HOME}/config

WORKDIR /etc/skel
RUN mkdir --parent .config "${KEEPASS2_HOME}/data" "${KEEPASS2_HOME}/config" \
 && ln --symbolic "${KEEPASS2_CONFIG}" .config/KeePass \
 && ln --symbolic "${KEEPASS2_DATA}" KeePass

VOLUME ["${KEEPASS2_DATA}", "${KEEPASS2_CONFIG}"]

ENV ENTRYPOINT_GROUPS="audio,video"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["keepass2"]
