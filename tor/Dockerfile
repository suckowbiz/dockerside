FROM suckowbiz/base
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

RUN apt-get --quiet --quiet update \ 
 && apt-get install --quiet --quiet --no-install-recommends \
    tor \
    tor-geoipdb \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 9050

ENTRYPOINT ["tor", "SOCKSPort", "0.0.0.0:9050"]
CMD ["StrictNodes", "1", "ExitNodes", "{ca},{is},{pt},{cz},{ro},{bg}"]
