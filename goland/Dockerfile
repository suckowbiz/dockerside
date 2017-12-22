# These instructions serve the purpose to run Intellij IDEA.
FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV GO_TARBALL="go1.9.2.linux-amd64.tar.gz" \
    GOLAND_TARBALL="goland-2017.3.tar.gz" \
    GOPATH="/opt/GolandProjects" \
    PATH="${PATH}:/usr/local/go/bin:/usr/local/goland/bin:/opt/GolandProjects/bin"

RUN apt-get install --quiet --quiet --yes --no-install-recommends \
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
    https://download.jetbrains.com/go/${GOLAND_TARBALL}{,.sha256} \
 && sha256sum --check ${GOLAND_TARBALL}.sha256 || false \
 && tar --extract --file ${GOLAND_TARBALL} \
 && rm --force ${GOLAND_TARBALL} ${GOLAND_TARBALL}.sha256 \
 && mv GoLand-* goland \
 && sed --in-place "s/.*idea.config.path=.*/idea.config.path=\~\/\.GoLand\/config\//" /usr/local/goland/bin/idea.properties \
 && sed --in-place "s/.*idea.system.path=.*/idea.system.path=\~\/\.GoLand\/system\//" /usr/local/goland/bin/idea.properties

WORKDIR /etc/skel
RUN ln --symbolic /opt/.gitconfig \
 && ln --symbolic /opt/GoLandProjects \
 && ln --symbolic /opt/.GoLand \
 && ln --symbolic /opt/.java \
 && ln --symbolic /opt/.ssh

ENTRYPOINT ["/entrypoint.sh", "goland.sh"]
