FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV GIMP_VERSION=2.8 \
    USER_PICTURES=/var/lib/gimp/pictures

RUN add-apt-repository --yes ppa:otto-kesselgulasch/gimp \
 && apt-get update --quiet \
 && apt-get install --quiet --yes --no-install-recommends \
    # FIXME: Fix to 2.8 since gimpps relies on it
    gimp \
    gimp-ufraw \
    gimp-help-en \
    gimp-gap \
    gimp-gutenprint

WORKDIR /etc/skel
RUN ln --symbolic "${USER_PICTURES}" Pictures

# Added to make GIMP look like PS.
WORKDIR /var/lib/gimp
RUN curl --fail --location --remote-name --show-error --silent https://github.com/doctormo/GimpPs/archive/master.zip \
 && unzip master.zip \
 && rm master.zip \
 && mv GimpPs-master "/etc/skel/.gimp-${GIMP_VERSION}"

VOLUME "${USER_PICTURES}"

# FIXME: Remember settings
# VOLUME ["${USER_CONFIG}"]

WORKDIR "${USER_PICTURES}"
ENTRYPOINT ["/entrypoint.sh", "gimp"]