FROM suckowbiz/base

LABEL maintainer=tobias@suckow.biz \
      name=nfs-hub

ENV BINDFS_TARGET_ROOT=/nfs

COPY context /
RUN apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    bindfs \
    nfs-common \
 && apt-get clean

VOLUME "${BINDFS_TARGET_ROOT}"
ENTRYPOINT ["/entrypoint-ext.sh"]
