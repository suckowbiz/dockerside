FROM suckowbiz/base-builder

MAINTAINER Tobias Suckow <tobias@suckow.biz>

# Conventionally named SUPERTUX USER DIRECTORY
ENV SUPERTUX2_USER_DIR="/var/lib/supertux2"

RUN apt-get update && apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    cmake \
    git \
    libboost-all-dev \
    libcurl4-openssl-dev \
    libglew-dev \
    libopenal-dev \
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

VOLUME ["${SUPERTUX2_USER_DIR}"]

ENV ENTRYPOINT_GROUPS="audio,video"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/opt/supertux/build/supertux2"]
