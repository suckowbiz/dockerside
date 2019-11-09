FROM suckowbiz/base-av
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV VERSION_GO="1.13.3" \
    VERSION_GOLAND="2019.2.5" \
    VERSION_GOLANGCI_LINT="1.21.0"

# Markdown preview requires javafx (wich requires libxslt).
# Using testcontainers-go requires to have "ip" command available. It's provided with ifupdown2.
# Using git requires "ssh" in case of a SSH connection.
RUN apt-get install --quiet --quiet --yes --no-install-recommends \
    bash-completion \
    build-essential \
    chromium-browser \
    docker.io \
    git \
    ifupdown2 \
    libxtst6 \
    libxtst-dev \
    libxslt1.1 \
    man \
    openjfx \
    ssh \
    zip \
 && apt-get clean --quiet \
 && apt-get autoremove --quiet \
 && rm -rf /var/lib/apt/lists/*

COPY context /

# Install the go distribution to provide golang environment.
# Reference: https://golang.org/doc/install#install
RUN curl \
    --fail \
    --location \
    --show-error \
    "https://dl.google.com/go/go${VERSION_GO}.linux-amd64.tar.gz" | tar --directory /usr/local --extract --gzip
ENV PATH="${PATH}:/usr/local/go/bin"

# Run a test to verify that Go is installed correctly.
WORKDIR /root/go/src/hello
RUN go build \
  && ./hello > hello.actual \
  && diff hello.actual hello.expected \
  && test "$?" = "0" || (echo "Go installation seems broken"; exit 1) \
  && go clean -i

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

# Git completion to ease working with git.
RUN curl \
    --fail \
    --location \
    --show-error \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
    --output /git-completion.bash \
  && chmod +x /git-completion.bash

# go bash completion to ease working with the go tool.
RUN go get -u github.com/posener/complete/gocomplete \
 && GOBIN=/usr/local/bin go install github.com/posener/complete/gocomplete \
 && echo "complete -C gocomplete go" >> /etc/bash.bashrc

# Install goimports to have it available for configuration as file watcher within GoLand.
RUN go get golang.org/x/tools/cmd/goimports \
 && GOBIN=/usr/local/bin go install golang.org/x/tools/cmd/goimports

# Install golangci-lint to have it available for configuration as file watcher within GoLand.
RUN curl \
    --fail \
    --location \
    --remote-name \
    --show-error \
    https://github.com/golangci/golangci-lint/releases/download/v${VERSION_GOLANGCI_LINT}/golangci-lint-${VERSION_GOLANGCI_LINT}-linux-386.tar.gz \
  && tar --extract --file golangci-lint-${VERSION_GOLANGCI_LINT}-linux-386.tar.gz \
  && chmod +x golangci-lint-${VERSION_GOLANGCI_LINT}-linux-386/golangci-lint \
  && mv golangci-lint-${VERSION_GOLANGCI_LINT}-linux-386/golangci-lint /usr/local/bin/golangci-lint \
  && rm --force --recursive golangci-lint-*

# Prepare user home to link runtime data to persistent directories.
WORKDIR /etc/skel
# In case /volume/gitconfig/.gitconfig is being written by git it will try to create a .gitconfig.lock file which must not fail.
RUN mkdir --parent /volume/gitconfig \
  && chmod 777 /volume/gitconfig
ENV GOPATH="/volume/go"
ENV GOROOT="/usr/local/go" \
    GOBIN="${GOPATH}/bin" \
    PATH="${PATH}:${GOPATH}/bin" \
    VOL_GIT_CONF="/volume/gitconfig" \
    VOL_GO="${GOPATH}" \
    VOL_GOLAND_CONF="/volume/.GoLand" \
    VOL_JAVA_CONF="/volume/.java" \
    VOL_SSH="/volume/.ssh"
RUN for volume in "${VOL_GIT_CONF}/.gitconfig" "${VOL_GO}" "${VOL_GOLAND_CONF}" "${VOL_JAVA_CONF}" "${VOL_SSH}"; do ln --symbolic "${volume}"; done
VOLUME ["${VOL_GIT_CONF}", "${VOL_GO}", "${VOL_GOLAND_CONF}", "${VOL_JAVA_CONF}", "${VOL_SSH}"]

# Add support for integration of go modules.
ENV GO111MODULE=on

# In case one runs "go tool tour" on 3999 the go tour server is listening.
EXPOSE 3999

ENV ENTRYPOINT_GROUPS="audio,video,docker,sudo" \
    ENTRYPOINT_WORKDIR="${VOL_GO}"

ENTRYPOINT ["/entrypoint.sh", "goland.sh"]
