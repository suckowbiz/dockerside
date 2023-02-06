FROM suckowbiz/base-av
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ARG VERSION_GO=1.20
ARG VERSION_GOLAND=2022.3.1
ARG VERSION_GOLANGCI_LINT=1.51.1
ARG VERSION_SHELLCHECK=0.9.0

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
 && sed --in-place "s/.*idea.system.path=.*/idea.system.path=\~\/\.GoLand\/system\//" goland/bin/idea.properties \
 && sed --in-place "s/.*idea.plugins.path=.*/idea.plugins.path=\~\/\.GoLand\/config\/plugins\//" goland/bin/idea.properties \
 && sed --in-place "s/.*idea.log.path=.*/idea.log.path=\~\/\.GoLand\/log\//" goland/bin/idea.properties
ENV PATH="${PATH}:/opt/goland/bin"

# Goland: Enable transparent backround on icons when using remote x11 to have a nice environment even on remote X11.
# https://intellij-support.jetbrains.com/hc/en-us/articles/4403466097042-Icons-do-not-have-transparent-background-slow-performance-over-remote-X11-server-connections
RUN echo '-Dremote.x11.workaround=false' >> /opt/goland/bin/goland64.vmoptions

# libsecret-1-0 gnome-keyring - remember credentials with git
# ssh - using git requires it in case of a SSH connection.
# libnss3 - resolves: 2020-11-21 10:19:48,529 [  14778]  ERROR - pplication.impl.LaterInvocator - /opt/goland/jbr/lib/libjcef.so: libnss3.so: cannot open shared object file: No such file or directory java.lang.UnsatisfiedLinkError: /opt/goland/jbr/lib/libjcef.so: libnss3.so: cannot open shared object file: No such file or directory
RUN apt-get install --quiet --quiet --no-install-recommends \
    bash-completion \
    build-essential \
    firefox \
    docker.io \
    git \
    gnome-keyring \
    libnss3 \
    libxtst6 \
    libxtst-dev \
    libsecret-1-0 \
    man \
    ssh \
    zip \
 && apt-get clean --quiet \
 && apt-get autoremove --quiet \
 && rm -rf /var/lib/apt/lists/*

COPY context /

# Install shellcheck to support Bash code analysis.
RUN curl \
    --fail \
    --location \
    --show-error \
    https://github.com/koalaman/shellcheck/releases/download/v${VERSION_SHELLCHECK}/shellcheck-v${VERSION_SHELLCHECK}.linux.x86_64.tar.xz | tar --extract --xz \
  && mv shellcheck-v${VERSION_SHELLCHECK}/shellcheck /usr/bin/shellcheck \
  && rm --recursive --force shellcheck-v${VERSION_SHELLCHECK} \
  && chmod +x /usr/bin/shellcheck

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
RUN go mod init \
  && go build \
  && ./hello > hello.actual \
  && diff hello.actual hello.expected \
  && test "$?" = "0" || (echo "Go installation seems broken"; exit 1) \
  && go clean -i

# Git completion to ease working with git.
RUN curl \
    --fail \
    --location \
    --show-error \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
    --output /git-completion.bash \
  && chmod +x /git-completion.bash

# Provide a Git prompt to ease working with Git.
COPY bashrc.partial /var/tmp/bashrc.partial
RUN cat /var/tmp/bashrc.partial >> /etc/bash.bashrc \
 && rm --force /var/tmp/bashrc.partial

# go bash completion to ease working with the go tool.
RUN GOBIN=/usr/local/bin go install github.com/posener/complete/gocomplete@v1 \
  && echo "complete -C gocomplete go" >> /etc/bash.bashrc

# Install goimports to have it available for configuration as file watcher within GoLand.
RUN GOBIN=/usr/local/bin go install golang.org/x/tools/cmd/goimports@latest

# Install golangci-lint to have it available for configuration within GoLand.
RUN curl \
    --fail \
    --location \
    --remote-name \
    --show-error \
    https://github.com/golangci/golangci-lint/releases/download/v${VERSION_GOLANGCI_LINT}/golangci-lint-${VERSION_GOLANGCI_LINT}-linux-amd64.tar.gz \
  && tar --extract --file golangci-lint-${VERSION_GOLANGCI_LINT}-linux-amd64.tar.gz \
  && chmod +x golangci-lint-${VERSION_GOLANGCI_LINT}-linux-amd64/golangci-lint \
  && mv golangci-lint-${VERSION_GOLANGCI_LINT}-linux-amd64/golangci-lint /usr/local/bin/golangci-lint \
  && rm --force --recursive golangci-lint-*

# Prepare user home to link runtime data to persistent directories.
WORKDIR /etc/skel
# In case /volume/gitconfig/.gitconfig is being written by git it will try to create a .gitconfig.lock file which must not fail.
RUN mkdir --parent /volume/gitconfig /volume/.local/share/JetBrains \
  && chmod 777 /volume/gitconfig /volume/.local/share/JetBrains
ENV GOPATH="/volume/go"
ENV GOROOT="/usr/local/go" \
    GOBIN="${GOPATH}/bin" \
    PATH="${PATH}:${GOPATH}/bin" \
    VOL_GIT_CONF="/volume/gitconfig" \
    VOL_GO="${GOPATH}" \
    VOL_GOLAND_CONF="/volume/.GoLand" \
    VOL_CONFIG="/volume/.config" \
    VOL_LOCAL="/volume/.local" \
    VOL_JAVA_CONF="/volume/.java" \
    VOL_SSH="/volume/.ssh"
RUN for volume in "${VOL_GIT_CONF}/.gitconfig" "${VOL_CONFIG}" "${VOL_GO}" "${VOL_GOLAND_CONF}" "${VOL_LOCAL}" "${VOL_JAVA_CONF}" "${VOL_SSH}"; do \
      ln --symbolic "${volume}"; \
    done
VOLUME ["${VOL_GIT_CONF}", "${VOL_CONFIG}", "${VOL_GO}", "${VOL_GOLAND_CONF}", "${VOL_LOCAL}", "${VOL_JAVA_CONF}", "${VOL_SSH}"]

# In case one runs "go tool tour" on 3999 the go tour server is listening.
EXPOSE 3999

ENV ENTRYPOINT_GROUPS="audio,video,docker,sudo" \
    ENTRYPOINT_WORKDIR="${VOL_GO}"

ENTRYPOINT ["/entrypoint.sh", "goland.sh"]
