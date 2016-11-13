FROM suckowbiz/base-av

MAINTAINER Tobias Suckow <tobias@suckow.biz>

# Install Google Chrome from third party ppa.
# http://www.ubuntuupdates.org/ppa/google_chrome
# https://www.google.com/linuxrepositories/
COPY context /
RUN curl -kfLOSs https://dl.google.com/linux/linux_signing_key.pub \
 && apt-key add linux_signing_key.pub \
 && apt-get --quiet --quiet update \
 && apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    google-chrome-stable

ENV ENTRYPOINT_GROUPS="audio,video"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["google-chrome", "--user-data-dir=/data", "--incognito"]
