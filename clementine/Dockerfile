FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV USER_MUSIC=/var/lib/clementine/music \
    USER_CONFIG=/var/lib/clementine/config

RUN apt-get --quiet --quiet update \ 
 && apt-get --quiet --assume-yes install \
    clementine \
    libssl1.0-dev \
    libclutter-gst-2.0

WORKDIR /etc/skel
RUN ln --symbolic "${USER_MUSIC}" Music \
 && mkdir .config \
 && ln --symbolic "${USER_CONFIG}" .config/Clementine

ENV ENTRYPOINT_GROUPS="audio,video" \
 # Get rid of "X Error: BadDrawable (invalid Pixmap or Window parameter) 9"
 QT_X11_NO_MITSHM=1

VOLUME ["${USER_MUSIC}"]
VOLUME ["${USER_CONFIG}"]

ENTRYPOINT ["/entrypoint.sh", "clementine"]