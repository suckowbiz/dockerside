FROM suckowbiz/chrome

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

COPY context /

#    "--install-chrome-app=haiffjcadagjlijoggckpgfnoeiflnem", \
#    "--disable-sync", \
# https://github.com/GoogleChrome/chrome-launcher/blob/master/docs/chrome-flags-for-tools.md
CMD [ "--app", \
    "--app-id=haiffjcadagjlijoggckpgfnoeiflnem", \
    "--disable-dev-shm-usage", \
    "--no-default-browser-check", \
    "--no-first-run", \
    "--start-maximized" ]