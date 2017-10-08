FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

COPY context /
RUN apt-get --quiet --quiet --yes --no-install-recommends install \
    TODO

ENTRYPOINT ["/entrypoint.sh"]
CMD ["TODO"]
