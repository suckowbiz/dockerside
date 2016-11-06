FROM suckowbiz/base-av

MAINTAINER Tobias Suckow <tobias@suckow.biz>

RUN add-apt-repository ppa:me-davidsansome/clementine \
 && apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    clementine \
    libclutter-gst-2.0

ENV ENTRYPOINT_GROUPS="audio,video" \
 # Get rid of "X Error: BadDrawable (invalid Pixmap or Window parameter) 9"
 QT_X11_NO_MITSHM=1

COPY context /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["clementine"]
