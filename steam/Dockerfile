FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV USER_DATA=/var/lib/steam

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
RUN curl --insecure --location --show-error --silent --remote-name https://steamcdn-a.akamaihd.net/client/installer/steam.deb \
 && dpkg --install steam.deb || true \
 && apt-get install --fix-broken --assume-yes

WORKDIR /etc/skel
RUN mkdir --parent .local/share \
 && ln -s "${USER_DATA}" .local/share/Steam

VOLUME "${USER_DATA}"

ENV ENTRYPOINT_GROUPS="games,video,audio"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["steam"]
