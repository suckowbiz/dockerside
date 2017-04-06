FROM suckowbiz/base-av

LABEL maintainer=tobias@suckow.biz \
      name=base

COPY context /
RUN apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    TODO

ENV ENTRYPOINT_GROUPS="audio,video"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["TODO"]
