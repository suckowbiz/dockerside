FROM suckowbiz/base

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

# Conventionally named SUPERTUX USER DIRECTORY
ENV SUPERTUX2_USER_DIR="/var/lib/supertux2"

RUN apt-get update --quiet \
 && apt-get --quiet --quiet --yes --no-install-recommends install \
    build-essential \
    cmake \
    git \
    libcurl4-openssl-dev \
    libboost-all-dev \
    libglew-dev \
    libopenal-dev \
    libpng-dev \
    libsdl2-dev \
    libsdl2-image-dev \
    libvorbis-dev

WORKDIR /opt
RUN git clone --depth 1 --recurse-submodules https://github.com/SuperTux/supertux.git \
 && cd supertux \
 && git submodule update --init --recursive \
 && mkdir build \
 && cd build \
 && cmake .. \
 && make \
 && make install

VOLUME "${SUPERTUX2_USER_DIR}"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/opt/supertux/build/supertux2"]
