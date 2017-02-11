FROM suckowbiz/base-builder

MAINTAINER Tobias Suckow <tobias@suckow.biz>

ENV VERSION_GIT=2.11.1 \
    GIT_HOME="/var/lib/git"

ENV GIT_CONFIG_DIR="${GIT_HOME}/config" \
    # Tell git where the .git repository is located since the work tree is customized.
    GIT_DIR="${GIT_HOME}/repository/.git" \
    SSH_CONFIG_DIR=/var/lib/ssh \
    URL_GIT_SOURCES_TAR_GZ="https://github.com/git/git/archive/v${VERSION_GIT}.tar.gz"

RUN apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    asciidoc \
    autoconf \
    docbook \
    gettext \
    less \
    man \
    ssh \
    tcl \
    tk \
    xsltproc \
    xmlto \
    zlib1g-dev

WORKDIR /opt
RUN curl --fail --location --show-error --silent --output git.tar.gz "${URL_GIT_SOURCES_TAR_GZ}" \
 && tar --extract --file git.tar.gz \
 && rm --force git.tar.gz \
 && cd "git-${VERSION_GIT}" \
 && make configure \
 && ./configure --prefix=/usr \
 && make all doc \
 && make install install-doc install-html

WORKDIR /opt/"git-${VERSION_GIT}"/contrib/subtree
RUN make \
 && make install install-doc

WORKDIR /etc/skel/
RUN mkdir .config \
 && ln --symbolic "${GIT_CONFIG_DIR}" .config/git \
 && ln --symbolic "${SSH_CONFIG_DIR}" .ssh

VOLUME ["${SSH_CONFIG_DIR}"]
VOLUME ["${GIT_CONFIG_DIR}"]

ENTRYPOINT ["/entrypoint.sh", "git"]
CMD ["--help"]
