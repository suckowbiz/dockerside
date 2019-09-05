FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV CALIBRE_CONFIG="/var/lib/calibre/config" \
    CALIBRE_LIB="/var/lib/calibre/Calibre Library"

# See https://calibre-ebook.com/download_linux
RUN curl --fail --location https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin install_dir=/opt/calibre-bin isolated=y
ENV PATH="${PATH}:/opt/calibre-bin/calibre/"

WORKDIR /etc/skel
RUN ln --symbolic "${CALIBRE_CONFIG}" ".config" \
 && ln --symbolic "${CALIBRE_LIB}"

VOLUME ["${CALIBRE_CONFIG}", "${CALIBRE_LIB}"]

ENTRYPOINT ["/entrypoint.sh", "calibre"]
CMD ["--no-update-check"]