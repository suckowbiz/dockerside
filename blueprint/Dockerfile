FROM suckowbiz/base-av

MAINTAINER Tobias Suckow <tobias@suckow.biz>

COPY context /
RUN apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    TODO

ENV ENTRYPOINT_GROUPS="audio,video"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["TODO"]
