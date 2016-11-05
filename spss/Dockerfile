FROM suckowbiz/base

RUN apt-get install --quiet --assume-yes --no-install-recommends \
    bc \
    libstdc++5 \
    libxi6 \
    libxft2 \
    libxtst6 \
    unzip \
 && apt-get --quiet clean \
 && apt-get --quiet autoremove \
 && rm -rf /var/lib/apt/lists/*

VOLUME ["/SPSS_STORE"]
WORKDIR ["/SPSS_STORE"]

COPY SPSS_Statistics_24_lin.bin .
RUN ./SPSS_Statistics_24_lin.bin -i silent -DLICENSE_ACCEPTED=true || true
CMD ["/opt/IBM/SPSS/Statistics/24/bin/stats"]
