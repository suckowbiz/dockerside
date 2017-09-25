FROM suckowbiz/base

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

RUN apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    nfs-common \
    pkg-config \
 && apt-get clean

COPY context /
ENTRYPOINT ["/start.sh"]
