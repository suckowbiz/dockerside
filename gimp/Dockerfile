FROM suckowbiz/base-av

MAINTAINER tobias@suckow.biz

RUN add-apt-repository --yes ppa:otto-kesselgulasch/gimp \
 && apt-get install --quiet --yes --no-install-recommends \
    gimp \
    gimp-ufraw \
    gimp-help-en \
    gimp-gap \
    gimp-gutenprint

# Added to make GIMP look like PS.
RUN curl -fLOSs https://github.com/doctormo/GimpPs/archive/master.zip \
 && unzip master.zip \
 && rm master.zip \
 && mv GimpPs-master /etc/skel/.gimp-2.8

COPY context /
WORKDIR /Pictures
ENTRYPOINT ["/entrypoint.sh"]
CMD ["gimp"]