FROM golang:1.21 AS builder
# See: 
# https://github.com/caddyserver/caddy
# https://github.com/caddyserver/xcaddy
ENV VERSION_CADDY=2.7.5 \
    VERSION_XCADDY=0.3.5
RUN curl \
        --fail \
        --location \
        --show-error \
        https://github.com/caddyserver/xcaddy/releases/download/v${VERSION_XCADDY}/xcaddy_${VERSION_XCADDY}_linux_amd64.tar.gz \
        --output xcaddy.tar.gz \
 && tar --extract --file xcaddy.tar.gz \
 && chmod +x xcaddy
RUN ./xcaddy build v${VERSION_CADDY} \
        --output /usr/local/bin/caddy \
        --with github.com/caddy-dns/cloudflare

FROM suckowbiz/base
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"
COPY --from=builder /usr/local/bin/caddy /usr/local/bin/
# If the XDG_DATA_HOME environment variable is set, data directory is $XDG_DATA_HOME/caddy.
ENV XDG_DATA_HOME=/var/lib/caddy/
WORKDIR ${XDG_DATA_HOME}
 # allow caddy to bind to :80 and :443
RUN apt-get install --quiet --quiet --no-install-recommends \
    libcap2-bin \
 && setcap CAP_NET_BIND_SERVICE=+eip /usr/local/bin/caddy 
VOLUME [ "${XDG_DATA_HOME}", "/var/lib/caddy/Caddyfile" ]
ENTRYPOINT [ "/entrypoint.sh", "caddy" ]
CMD [ "run" ]
