# These instructions serve the purpose to run Intellij IDEA.
FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV GO_TARBALL="go1.9.1.linux-amd64.tar.gz" \
    GOGLAND_TARBALL="gogland-173.2696.28.tar.gz" \
    GOPATH="/opt/GoglandProjects" \
    PATH="${PATH}:/usr/local/go/bin:/usr/local/gogland/bin:/opt/GoglandProjects/bin"

RUN apt-get update --quiet \
 && apt-get install --auto-remove --assume-yes --no-install-recommends  --quiet \
    git \
    openjdk-8-* \
    openjfx \
    libappindicator1 \
    libcurl3 \
    libxss1 \
    man \
 && apt-get clean --quiet \
 && apt-get autoremove --quiet \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local
RUN curl \
        --fail \
        --location \
        --remote-name \
        --show-error \
        https://storage.googleapis.com/golang/${GO_TARBALL} \
 && tar --extract --file ${GO_TARBALL} \
 && rm --force ${GO_TARBALL}

RUN curl \
        --fail \
        --location \
        --remote-name \
        --show-error \
        https://download.jetbrains.com/go/${GOGLAND_TARBALL}{,.sha256} \
 && sha256sum --check ${GOGLAND_TARBALL}.sha256 || false \
 && tar --extract --file ${GOGLAND_TARBALL} \
 && rm --force ${GOGLAND_TARBALL} ${GOGLAND_TARBALL}.sha256 \
 && mv Gogland-* gogland \
 && sed --in-place "s/.*idea.config.path=.*/idea.config.path=\~\/\.Gogland\/config\//" /usr/local/gogland/bin/idea.properties \
 && sed --in-place "s/.*idea.system.path=.*/idea.system.path=\~\/\.Gogland\/system\//" /usr/local/gogland/bin/idea.properties

WORKDIR /etc/skel
RUN ln --symbolic /opt/.gitconfig \
 && ln --symbolic /opt/GoglandProjects \
 && ln --symbolic /opt/.Gogland \
 && ln --symbolic /opt/.java \
 && ln --symbolic /opt/.ssh

ENTRYPOINT ["/entrypoint.sh", "gogland.sh"]
