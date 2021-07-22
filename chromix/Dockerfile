FROM suckowbiz/chrome
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

COPY context /

#    "--install-chrome-app=haiffjcadagjlijoggckpgfnoeiflnem", \
#    "--disable-sync", \
# See https://github.com/GoogleChrome/chrome-launcher/blob/master/docs/chrome-flags-for-tools.md
#
# Citrix seems to have a bug with Passthroug: "[...]ERROR:gpu_init.cc(426) Passthrough is not supported, GL is disabled[...]"
# See: https://stackoverflow.com/questions/67501093/passthrough-is-not-supported-gl-is-disabled
CMD [ "--app", \
    "--app-id=haiffjcadagjlijoggckpgfnoeiflnem", \
    "--disable-dev-shm-usage", \
    "--no-default-browser-check", \
    "--no-first-run", \
    "--disable-gpu", \
    "--disable-software-rasterizer", \
    "--start-maximized" ]