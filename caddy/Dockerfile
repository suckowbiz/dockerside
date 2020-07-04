FROM golang:buster AS builder
ENV VERSION_CADDY=2.1.1 \
    VERSION_XCADDY=0.1.4
RUN curl \
        --fail \
        --location \
        --show-error \
        https://github.com/caddyserver/xcaddy/releases/download/v${VERSION_XCADDY}/xcaddy_v${VERSION_XCADDY}_linux_amd64 \
        --output xcaddy \
 && chmod +x xcaddy
RUN ./xcaddy build v${VERSION_CADDY} \
        --output /usr/local/bin/caddy \
        --with github.com/caddy-dns/cloudflare

FROM suckowbiz/base
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"
# if set, Caddy will use this folder to store assets instead of the default $HOME/.caddy.
ENV CADDYPATH=/var/lib/caddy/.caddy \
    PATH="${PATH}:/var/lib/caddy"
WORKDIR /var/lib/caddy
COPY --from=builder /usr/local/bin/caddy .
RUN apt-get install --quiet --quiet --no-install-recommends \
    libcap2-bin \
 && mkdir --parent "${CADDYPATH}" \
 # allow caddy to bind to :80 and :443
 && setcap CAP_NET_BIND_SERVICE=+eip caddy 
VOLUME "${CADDYPATH}"
ENTRYPOINT ["/entrypoint.sh", "caddy"]
CMD ["run"]
