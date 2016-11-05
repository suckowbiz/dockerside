# These instructions serve the purpose to set up a HTTP proxy that can be used to anonymize web browsing (besides it caches content and blocks spam).
FROM suckowbiz/base

MAINTAINER Tobias Suckow <tobias@suckow.biz>

RUN apt-get install --quiet --assume-yes --no-install-recommends \
    privoxy \
    squid \
    tor \
    tor-geoipdb

COPY context /
ENTRYPOINT ["/entrypoint.sh"]
