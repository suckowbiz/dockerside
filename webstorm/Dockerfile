FROM suckowbiz/base-av
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV VERSION_WEBSTORM_MAJOR="2019.1" \
  VERSION_WEBSTORM_MINOR=".3" \
  INSTALL_HOME=/opt/webstorm

ENV VERSION_WEBSTORM="${VERSION_WEBSTORM_MAJOR}${VERSION_WEBSTORM_MINOR}"

# Markdown preview requires javafx (wich requires libxslt).
# In order for some npm packages to work the build-essential package is required.
RUN apt-get install --quiet --quiet --yes --no-install-recommends \
    build-essential \
    chromium-browser \
    docker.io \
    git \
    libxtst6 \
    libxtst-dev \
    libxslt1.1 \
    man \
    nodejs \
    npm \
    openjfx \
 && apt-get clean --quiet \
 && apt-get autoremove --quiet \
 && rm -rf /var/lib/apt/lists/*

# Git completion to ease working with git.
RUN curl \
    --fail \
    --location \
    --show-error \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
    --output /git-completion.bash \
  && chmod +x /git-completion.bash

WORKDIR ${INSTALL_HOME}
RUN curl \
  --fail\
  --location \
  --remote-name \
  --show-error \
  "https://download.jetbrains.com/webstorm/WebStorm-${VERSION_WEBSTORM}.tar.gz{,.sha256}" \
 && sha256sum --check "WebStorm-${VERSION_WEBSTORM}.tar.gz.sha256" | grep "OK" \
 && tar --extract --file "WebStorm-${VERSION_WEBSTORM}.tar.gz" --strip 1 \
 && rm --force WebStorm-${VERSION_WEBSTORM}.*

ENV PATH="${PATH}:${INSTALL_HOME}/bin"

# Prepare user home to link runtime data to persistent directories.
WORKDIR /etc/skel
# In case /volume/gitconfig/.gitconfig is being written by git it will try to create a .gitconfig.lock file which must not fail.
RUN mkdir --parent /volume/gitconfig \
  && chmod 777 /volume/gitconfig
ENV VOL_GIT_CONF="/volume/gitconfig" \
    VOL_WORKSPACE="/volume/workspace" \
    VOL_WEBSTORM_CONF="/volume/.WebStorm" \
    VOL_JAVA_CONF="/volume/.java"
RUN for volume in "${VOL_GIT_CONF}/.gitconfig"  "${VOL_WORKSPACE}" "${VOL_JAVA_CONF}"; do ln --symbolic "${volume}"; done \
  && ln --symbolic "${VOL_WEBSTORM_CONF}" ".WebStorm${VERSION_WEBSTORM_MAJOR}"
VOLUME ["${VOL_GIT_CONF}", "${VOL_WEBSTORM_CONF}", "${VOL_JAVA_CONF}", "${VOL_WORKSPACE}"]

ENV ENTRYPOINT_GROUPS="audio,video,docker"
ENTRYPOINT ["/entrypoint.sh", "webstorm.sh"]
