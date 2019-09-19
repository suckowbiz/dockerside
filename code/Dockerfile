## These instructions serve the purpose to run vscode.
FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
 && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
 && sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Java - Platform for PlantUML running. Java development. 
# Graphviz : PlantUML requires it to calculate positions in diagram.
# rxvt-* This avoids having non printable chars like "[]"" in menu.
RUN apt-get update --quiet \
 && apt-get install --quiet --quiet --yes --no-install-recommends \
    code \
    git \
    gvfs-bin \
    graphviz \
    libxss1 \
    libgconf-2-4 \
    openjdk-11-doc \
    openjdk-11-jdk \
    openjdk-11-source \
    openjdk-11-demo \
    openjdk-11-dbg \
    php \
    rxvt-unicode-256color \
    xz-utils \
 && apt-get clean --quiet \
 && apt-get autoremove --quiet \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN curl \
    --fail \
    --location \
    --remote-name \
    --show-error \
    https://storage.googleapis.com/shellcheck/shellcheck-stable.linux.x86_64.tar.xz \
 && tar --extract --file shellcheck-stable.linux.x86_64.tar.xz \
 && rm --force shellcheck-stable.linux.x86_64.tar.xz

ENV PATH="${PATH}:/opt/shellcheck-stable/"

WORKDIR /etc/skel
RUN ln --symbolic /Code Code \
 && ln --symbolic /opt/git/.gitconfig .gitconfig

VOLUME ["/opt/git/.gitconfig", "/opt/vscode/extensions", "/opt/vscode/userdata", "/Code"]
WORKDIR /Code

ENTRYPOINT ["/entrypoint.sh", "code"]
CMD ["--user-data-dir=/opt/vscode/userdata", \
     "--extensions-dir=/opt/vscode/extensions", \
     "--locale=en-US", \
     "--verbose", \
     "/Code"]
