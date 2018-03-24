FROM suckowbiz/base-av
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV VERSION_GOLAND="2017.3.3" \
    VERSION_GOLANG="1.10"

RUN apt-get install --quiet --quiet --yes --no-install-recommends \
    build-essential \
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

# Install go to have golang toolset available.
WORKDIR /usr/local
RUN curl \
    --fail \
    --location \
    --show-error \
    "https://storage.googleapis.com/golang/go${VERSION_GOLANG}.linux-amd64.tar.gz" | tar --extract --gzip
ENV PATH="${PATH}:/usr/local/go/bin"

# Get important development tools to improve development.
ENV GOBIN="/usr/bin/"
RUN go get -t golang.org/x/tools/cmd/goimports \
 && go get -u github.com/alecthomas/gometalinter \
 && gometalinter --install \
 && chmod 755 "/usr/bin/"
ENV GOBIN=""

# Build and run a go binary to verify go toolset is installed properly.
WORKDIR /root/go/src/hello
RUN echo "package main\n\nimport \"fmt\"\n\nfunc main() {\nfmt.Printf(\"hello, world\")\n}" > hello.go \
 && go build hello \
 && test "$(./hello)" = 'hello, world' \
 && rm --force --recursive /volume/go/src/hello

# Install goland to provide entrypoint of this Dockerfile.
WORKDIR /usr/local
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
 && sed --in-place "s/.*idea.config.path=.*/idea.config.path=\~\/\.GoLand\/config\//" /usr/local/goland/bin/idea.properties \
 && sed --in-place "s/.*idea.system.path=.*/idea.system.path=\~\/\.GoLand\/system\//" /usr/local/goland/bin/idea.properties
ENV PATH="${PATH}:/usr/local/goland/bin"

# Prepare user home to link runtime data to persisted volumes.
WORKDIR /etc/skel
ENV GOPATH="/volume/go" \
    VOL_GIT_CONF="/volume/.gitconfig" \
    VOL_GO="/volume/go" \
    VOL_GOLAND_CONF="/volume/.GoLand" \
    VOL_JAVA_CONF="/volume/.java"

RUN for volume in ${VOL_GIT_CONF} ${VOL_GO} ${VOL_GOLAND_CONF} ${VOL_JAVA_CONF}; do ln --symbolic "${volume}"; done

VOLUME ["${VOL_GIT_CONF}", "${VOL_GO}", "${VOL_GOLAND_CONF}", "${VOL_JAVA_CONF}"]
WORKDIR "${GOPATH}"
ENTRYPOINT ["/entrypoint.sh", "goland.sh"]
