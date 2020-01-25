FROM suckowbiz/base
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ARG CADDY_VERSION=v1.0.4
ARG CADDY_DOWNLOAD_ROOT=https://github.com/mholt/caddy/releases/download
ARG CADDY_REMOTE_NAME="caddy_${CADDY_VERSION}_linux_amd64"
   
# if set, Caddy will use this folder to store assets instead of the default $HOME/.caddy.
ENV CADDYPATH=/var/lib/caddy/.caddy \
    PATH="${PATH}:/var/lib/caddy" \
    CADDY_TARBALL=${CADDY_REMOTE_NAME}.tar.gz

WORKDIR /var/lib/caddy
RUN apt-get install --quiet --quiet --no-install-recommends \
    libcap2-bin \
 && mkdir --parent "${CADDYPATH}" \
 && curl \
      --fail \
      --location \
      --remote-name \
      --show-error \
      "${CADDY_DOWNLOAD_ROOT}/${CADDY_VERSION}/${CADDY_TARBALL}" \
 && tar --extract --file "${CADDY_TARBALL}" \
 && rm --force "${CADDY_TARBALL}" \
 && ls -la \
 # allow caddy to bind to :80 and :443
 && setcap CAP_NET_BIND_SERVICE=+eip caddy 

VOLUME "${CADDYPATH}"

ENTRYPOINT ["/entrypoint.sh", "caddy"]
CMD ["-agree", "-log", "stdout" ]
