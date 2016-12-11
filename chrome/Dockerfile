FROM suckowbiz/base-av

MAINTAINER Tobias Suckow <tobias@suckow.biz>

ENV USER_DATA_DIR="/var/lib/chrome/data" \
    USER_DOWNLOAD_DIR="/var/lib/chrome/downloads"

# Install Google Chrome from third party ppa.
# (source: http://www.ubuntuupdates.org/ppa/google_chrome, https://www.google.com/linuxrepositories/)
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
RUN curl --insecure --fail --location --remote-name --show-error --silent https://dl.google.com/linux/linux_signing_key.pub \
 && apt-key add linux_signing_key.pub \
 && apt-get --quiet --quiet update \
 && apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    google-chrome-stable

WORKDIR /etc/skel
RUN ln --symbolic "${USER_DOWNLOAD_DIR}" Downloads \
 && mkdir --parent .config/pulse \
 && ln --symbolic "${USER_DATA_DIR}" .config/google-chrome \
 && ln --symbolic /var/lib/pulse/cookie .config/pulse/cookie

VOLUME ["${USER_DOWNLOAD_DIR}"]
VOLUME ["${USER_DATA_DIR}"]

WORKDIR "/var/lib/chrome/downloads"
ENV ENTRYPOINT_GROUPS="audio,video"
ENTRYPOINT ["/entrypoint.sh", "google-chrome"]
