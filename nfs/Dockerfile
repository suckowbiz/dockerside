FROM suckowbiz/base

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

RUN apt-get --quiet --quiet --yes --no-install-recommends install \
    nfs-common \
    pkg-config \
 && apt-get clean

COPY context /
ENTRYPOINT ["/start.sh"]
