FROM suckowbiz/base-builder

LABEL maintainer=tobias@suckow.biz \
      name=nfs-hub

ENV BINDFS_TARGET_ROOT=/nfs \
    VERSION_BINDFS=1.13.7

RUN apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    libfuse-dev \
    nfs-common \
    pkg-config \
 && apt-get clean

RUN curl \
      --fail \
      --location \ 
      --remote-name \ 
      --show-error \
      "http://bindfs.org/downloads/bindfs-${VERSION_BINDFS}.tar.gz" \
 && echo "c087767dff91b714d5c517797457d479  bindfs-${VERSION_BINDFS}.tar.gz" > "bindfs-${VERSION_BINDFS}.tar.gz.md5" \
 && md5sum --check "bindfs-${VERSION_BINDFS}.tar.gz.md5" \
 && tar --extract --file "bindfs-${VERSION_BINDFS}.tar.gz" \
 && rm --force "bindfs-${VERSION_BINDFS}.tar.gz" \
 && cd "bindfs-${VERSION_BINDFS}" \
 && ./configure \
 && make \
 && make install

COPY context /
VOLUME "${BINDFS_TARGET_ROOT}"
ENTRYPOINT ["/entrypoint.sh"]
