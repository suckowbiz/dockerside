FROM suckowbiz/base-av
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV VERSION_GO="1.10" \
    VERSION_GOLAND="2018.1.2"

#     libappindicator1 \
RUN apt-get install --quiet --quiet --yes --no-install-recommends \
    build-essential \
    git \
    libxtst6 \
    libxtst-dev \
    man \
 && apt-get clean --quiet \
 && apt-get autoremove --quiet \
 && rm -rf /var/lib/apt/lists/*

# Install the go tools to provide golang environment: https://golang.org/doc/install#install
RUN curl \
    --fail \
    --location \
    --show-error \
    "https://storage.googleapis.com/golang/go${VERSION_GO}.linux-amd64.tar.gz" | tar --directory /usr/local --extract --gzip
ENV PATH="${PATH}:/usr/local/go/bin"

# Get important development tools to help finding issues when coding in go.
ENV GOBIN="/usr/local/go/bin"
RUN go get -t golang.org/x/tools/cmd/goimports \
 && go get -u github.com/alecthomas/gometalinter \
 && gometalinter --install \
ENV GOBIN=""

# Install goland to provide an entrypoint.
WORKDIR /opt
RUN curl \
    --fail \
    --location \
    --remote-name \
    --show-error \
    "https://download.jetbrains.com/go/goland-${VERSION_GOLAND}.tar.gz{,.sha256}" \
 && sha256sum --check "goland-${VERSION_GOLAND}.tar.gz.sha256" | grep "OK" \
 && tar --extract --file "goland-${VERSION_GOLAND}.tar.gz" \
 && rm --force "goland-${VERSION_GOLAND}.tar.gz" "goland-${VERSION_GOLAND}.tar.gz.sha256" \
 && mv GoLand-* goland \
 && sed --in-place "s/.*idea.config.path=.*/idea.config.path=\~\/\.GoLand\/config\//" goland/bin/idea.properties \
 && sed --in-place "s/.*idea.system.path=.*/idea.system.path=\~\/\.GoLand\/system\//" goland/bin/idea.properties
ENV PATH="${PATH}:/opt/goland/bin"

# Prepare user home to link runtime data to persistent directories.
WORKDIR /etc/skel
ENV GOROOT="/usr/local/go" \
    GOPATH="/volume/go" \
    GOBIN="/volume/go/bin" \
    VOL_GIT_CONF="/volume/.gitconfig" \
    VOL_GO="/volume/go" \
    VOL_GOLAND_CONF="/volume/.GoLand" \
    VOL_JAVA_CONF="/volume/.java"
RUN for volume in "${VOL_GIT_CONF}" "${VOL_GO}" "${VOL_GOLAND_CONF}" "${VOL_JAVA_CONF}"; do ln --symbolic "${volume}"; done

WORKDIR "${GOPATH}"
VOLUME ["${VOL_GIT_CONF}", "${VOL_GO}", "${VOL_GOLAND_CONF}", "${VOL_JAVA_CONF}"]
ENTRYPOINT ["/entrypoint.sh", "goland.sh"]
