FROM suckowbiz/base

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

# GUI rendering requires libGL permissions:
# libGL error: failed to open drm device: Permission denied
# libGL error: failed to load driver: i965
ENV ENTRYPOINT_GROUPS="audio,video"

RUN apt-get install --quiet --quiet --yes --no-install-recommends \
    # Advanced Linux Sound Architecture
    #alsa-* \
    alsa-base \
    alsa-oss \
    alsa-tools \
    dbus-x11 \
    # Fonts with the same metrics as Times, Arial and Courier
    fonts-liberation \
    # Light Themes (Ambiance and Radiance)
    light-themes \
    # Layout and rendering of internationalized text
    libpango1.0 \
    # simple abstract interface for playing event sounds
    #libcanberra-* \
    libcanberra-gtk3-dev \
    libcanberra-gtk3-module \
    libcanberra-gtk-module \
     # GStreamer backend for libcanberra
    libcanberra-gstreamer \
    # PulseAudio backend for libcanberra
    libcanberra-pulse \
    libgtk2.0 \
    # desktop integration utilities from freedesktop.org
    xdg-utils \
    #  X.Org X server
    xorg 
