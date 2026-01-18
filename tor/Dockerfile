FROM suckowbiz/base
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

RUN apt-get --quiet --quiet update \ 
 && apt-get install --quiet --quiet --no-install-recommends \
    tor \
    tor-geoipdb \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY context /

EXPOSE 9050

ENTRYPOINT ["tor"]
