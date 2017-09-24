## These instructions serve the purpose to run Intellij IDEA.
FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
 && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
 && sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

RUN apt-get update --quiet \
 && apt-get install --quiet --yes --no-install-recommends --auto-remove \
    code \
    git \
    gvfs-bin \
    # E.g. plantuml Plugin requires Graphviz
    graphviz \
    shellcheck \
    libxss1 \
    libgconf-2-4 \
    # E.g. plantuml Plugin requires JAVA
    openjdk-8-* \
    # This avoids having non printable chars like "[]"" in menu.
    rxvt-unicode-256color \
 && apt-get clean --quiet \
 && apt-get autoremove --quiet \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/skel
RUN ln --symbolic /Code Code \
 && ln --symbolic /opt/git/.gitconfig .gitconfig \
 && ln --symbolic /opt/SSH .ssh

ENV ENTRYPOINT_GROUPS="audio,video"

VOLUME ["/opt/git/.gitconfig", "/opt/SSH", "/opt/vscode/extensions", "/opt/vscode/userdata", "/Code"]
WORKDIR /Code
ENTRYPOINT ["/entrypoint.sh", "code",  "--user-data-dir", "/opt/vscode/userdata", "--extensions-dir", "/opt/vscode/extensions"]
CMD ["--locale", "en-US", \
     "--wait", \
     "/Code"]
