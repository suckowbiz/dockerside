FROM suckowbiz/base-av

MAINTAINER tobias@suckow.biz

# Steam requires a 32bit architecture.
RUN dpkg --add-architecture i386 \
 && apt-get update \
 && apt-get upgrade --yes \
 && apt-get install --yes \
    build-essential \
    libc6:i386 \
    libgpg-error-dev:i386 \
    libgl1-mesa-dri:i386 \
    libgl1-mesa-glx:i386 \
    libncurses5:i386 \
    libstdc++6:i386 \
    libstdc++6:i386 \
    xserver-xorg-video-intel

# The holy steam himself.
RUN curl -kfLOSs https://steamcdn-a.akamaihd.net/client/installer/steam.deb \
 && dpkg -i steam.deb || true \
 && apt-get install --fix-broken --assume-yes

COPY context /
ENV ENTRYPOINT_GROUPS="games,video"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["steam"]
