FROM suckowbiz/base

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

# A/V rendering requires group membership to access drm and load drivers.
ENV ENTRYPOINT_GROUPS="audio,video"

RUN apt-get install --quiet --quiet --yes --no-install-recommends \
    # Advanced Linux Sound Architecture
    alsa-base \
    dbus-x11 \
    # Intel i8xx, i9xx display driver
    xserver-xorg-video-intel \
    # Light Themes (Ambiance and Radiance)
    light-themes \
    # Layout and rendering of internationalized text
    libpango1.0 \
    # translates GTK+ widgets signals to event sounds. Both versions required.
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
     # GStreamer backend for libcanberra
    libcanberra-gstreamer \
    # PulseAudio backend for libcanberra
    libcanberra-pulse \
    libgtk2.0 \
    vim \
    # desktop integration utilities from freedesktop.org
    xdg-utils \
    #  X.Org X server
    xorg
