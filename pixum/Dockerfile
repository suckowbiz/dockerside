FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV ENTRYPOINT_GROUPS="audio,video" \
    CEWE_DIR="/data/pixum/cewe" \
    MCF_DIR="/data/pixum/mcf" \
    QT_DIR="/data/pixum/qt" \
    PIXUM_CONFIG_DIR="/data/pixum/config" \
    USER_PICTURES_DIR="/data/pictures"

RUN apt-get --quiet --quiet --yes --no-install-recommends install \
    expect \
    less \
    libxss1 \
    wget

WORKDIR /opt
# Download URL from: https://www.pixum.de/fotobuch/fotoalbum/fotoalbum-erstellen
RUN curl \
    --fail \
    --location \
    --show-error \
    --output pixum.tar.gz \
    https://dls.photoprintit.com/api/getClient/1291-de_DE/hps/b303030303030303030303030303030303030303030303030353835343733327/linux \
 && tar --extract --file pixum.tar.gz
COPY context .
RUN expect setup.exp 

RUN mkdir --parent "${CEWE_DIR}" "${MCF_DIR}" "${QT_DIR}" "${PIXUM_CONFIG_DIR}" "${USER_PICTURES_DIR}"
WORKDIR /etc/skel
RUN mkdir .config \
 && ln --symbolic "${CEWE_DIR}" ".config/CeWe Color" \
 && ln --symbolic "${MCF_DIR}" ".mcf" \
 && ln --symbolic "${PIXUM_CONFIG_DIR}" ".Pixum Fotowelt" \
 && ln --symbolic "${QT_DIR}" ".QtWebEngineProcess" \
 && ln --symbolic "${USER_PICTURES_DIR}" "Pictures"

VOLUME ["${CEWE_DIR}", "${MCF_DIR}", "${PIXUM_CONFIG_DIR}", "${QT_DIR}", "${USER_PICTURES_DIR}"]

WORKDIR "${USER_PICTURES_DIR}"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/opt/Pixum/Pixum Fotowelt/Pixum Fotowelt"]
