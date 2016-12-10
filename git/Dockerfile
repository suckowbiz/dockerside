FROM suckowbiz/base-builder

MAINTAINER Tobias Suckow <tobias@suckow.biz>

ENV VERSION_GIT=2.11.0
ENV GIT_CONFIG_DIR=/var/lib/git/config \
    # Git specific. Required since GIT_WORK_TREE is utilized.
    GIT_DIR=/var/lib/git/repository/.git \
    # Git specific. Utilized to set the repository to work with.
    GIT_WORK_TREE=/var/lib/git/repository \
    SSH_CONFIG_DIR=/var/lib/ssh \
    URL_GIT_SOURCES_TAR_GZ="https://github.com/git/git/archive/v${VERSION_GIT}.tar.gz"

RUN apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    asciidoc \
    autoconf \
    docbook \
    gettext \
    man \
    # Install "most" as manpage viewer to have syntax highlighting
    most \
    ssh \
    tcl \
    tk \
    xsltproc \
    xmlto \
    zlib1g-dev

WORKDIR /opt
RUN curl --fail --location --show-error --silent --output git.tar.gz "${URL_GIT_SOURCES_TAR_GZ}" \
 && tar -xf git.tar.gz \
 && rm -f git.tar.gz \
 && cd "git-${VERSION_GIT}" \
 && make configure \
 && ./configure --prefix=/usr \
 && make all doc \
 && make install install-doc install-html

WORKDIR /etc/skel/.config
RUN ln --symbolic "${GIT_CONFIG_DIR}" git \
 && ln --symbolic "${SSH_CONFIG_DIR}" .ssh

VOLUME ["${SSH_CONFIG_DIR}"]
VOLUME ["${GIT_CONFIG_DIR}"]
VOLUME ["${GIT_WORK_TREE}"]

ENTRYPOINT ["/entrypoint.sh", "git"]
CMD ["--help"]
