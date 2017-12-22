FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV USER_DATA_DIR="/var/lib/chrome/data" \
    USER_DOWNLOAD_DIR="/var/lib/chrome/downloads" \
    INSTALL_CANDIDATE=google-chrome-beta

# Install Google Chrome from third party ppa to have latest version.
# (source: http://www.ubuntuupdates.org/ppa/google_chrome, https://www.google.com/linuxrepositories/)
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
RUN curl \
    --insecure \
    --fail \
    --location \
    --remote-name \
    --show-error \
    https://dl.google.com/linux/linux_signing_key.pub \
 && apt-key add linux_signing_key.pub \
 && apt-get --quiet --quiet update \
 && apt-get --quiet --quiet --assume-yes --no-install-recommends install \
    "${INSTALL_CANDIDATE}" \
 && apt-get clean

WORKDIR /etc/skel
RUN ln --symbolic "${USER_DOWNLOAD_DIR}" Downloads \
 && mkdir --parent .config/pulse \
 && ln --symbolic "${USER_DATA_DIR}" ".config/${INSTALL_CANDIDATE}"

VOLUME ["${USER_DOWNLOAD_DIR}", "${USER_DATA_DIR}"]

WORKDIR "${USER_DOWNLOAD_DIR}"
ENTRYPOINT ["/entrypoint.sh", "google-chrome", "--no-referrers", "--start-maximized"]
