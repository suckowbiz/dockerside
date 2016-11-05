FROM suckowbiz/base

MAINTAINER Tobias Suckow <tobias@suckow.biz>

RUN apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    dbus-x11 \
    # audio
    libcanberra-gtk3-dev \
    libcanberra-gtk3-module \
    libcanberra-gtk-module \
    libcanberra-pulse \
    # video
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    light-themes \
    xserver-xorg-video-all
