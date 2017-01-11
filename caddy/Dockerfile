FROM suckowbiz/base

MAINTAINER Tobias Suckow <tobias@suckow.biz>

ENV CADDY_VERSION=0.9.4 \
    CADDY_DOWNLOAD_ROOT=https://github.com/mholt/caddy/releases/download/ \
    CADDY_REMOTE_NAME=caddy_linux_amd64 \
    CADDY_TARBALL=caddy_linux_amd64.tar.gz \
    # if set, Caddy will use this folder to store assets instead of the default $HOME/.caddy.
    CADDYPATH=/var/lib/caddy/.caddy
RUN mkdir --parent "${CADDYPATH}"

WORKDIR /var/lib/caddy
ENV CADDY_DOWNLOAD_URL="${CADDY_DOWNLOAD_ROOT}/v${CADDY_VERSION}/${CADDY_TARBALL}"
RUN curl --fail --location --remote-name --show-error --silent "${CADDY_DOWNLOAD_URL}" \
 && tar --extract --file "${CADDY_TARBALL}" \
 && rm --force "${CADDY_TARBALL}" \
 && mv "${CADDY_REMOTE_NAME}" caddy
ENV PATH="${PATH}:/var/lib/caddy"

VOLUME ["${CADDYPATH}"}]
ENTRYPOINT ["/entrypoint.sh", "caddy"]
CMD ["-agree", "-log", "stdout" ]