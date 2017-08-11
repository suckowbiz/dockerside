FROM suckowbiz/base

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

RUN apt-get --quiet --assume-yes --no-install-recommends install \
    dbus-x11 \
    language-pack-gnome-en \
    # audio
    # Advanced Linux Sound Architecture
    alsa-base \
    alsa-oss \
    alsa-tools \
    alsa-utils \
    # GStreamer: open source multimedia framework
    gstreamer1.0 \
    # simple abstract interface for playing event sounds
    libcanberra0 \
    # translates GTK+ widgets signals to event sounds
    libcanberra-gtk3-dev \
    libcanberra-gtk3-module \
    libcanberra-gtk-module \
    # GStreamer backend for libcanberra
    libcanberra-gstreamer \
    # PulseAudio backend for libcanberra
    libcanberra-pulse \
    # video
    # Fonts with the same metrics as Times, Arial and Courier
    fonts-liberation \
    # Layout and rendering of internationalized text
    libpango1.0 \
    # Light Themes (Ambiance and Radiance)
    light-themes \
    # desktop integration utilities from freedesktop.org
    xdg-utils \
    #  X.Org X server -- output driver metapackage (installs opengl as dependency)
    xserver-xorg-video-all
