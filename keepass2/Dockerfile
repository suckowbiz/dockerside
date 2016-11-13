FROM suckowbiz/base-av

MAINTAINER Tobias Suckow <tobias@suckow.biz>

RUN add-apt-repository ppa:jtaylor/keepass
RUN apt-get update \
 && apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    keepass2

COPY context /
ENV KEEPASS2_HOME=/opt/KeePass2
ENV KEEPASS2_DATA=${KEEPASS2_HOME}/data \
    KEEPASS2_CONFIG=${KEEPASS2_HOME}/config
RUN mkdir -p ${KEEPASS2_HOME}/data ${KEEPASS2_HOME}/config

ENV ENTRYPOINT_GROUPS="audio,video"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["keepass2"]
