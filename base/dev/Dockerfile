FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

# A/V rendering requires group membership to access drm and load drivers.
ENV ENTRYPOINT_GROUPS="audio,video,docker"

RUN apt-get install --quiet --quiet --yes --no-install-recommends docker.io