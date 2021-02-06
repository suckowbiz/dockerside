FROM quay.io/suckowbiz/base-av
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV USER_PICTURES=/var/lib/gimp/pictures

RUN apt-get install --quiet --quiet --yes --no-install-recommends \
    gimp

WORKDIR /etc/skel
RUN ln --symbolic "${USER_PICTURES}" Pictures

VOLUME "${USER_PICTURES}"

# FIXME: Remember settings
# VOLUME ["${USER_CONFIG}"]

WORKDIR "${USER_PICTURES}"
ENTRYPOINT ["/entrypoint.sh", "gimp"]
