FROM suckowbiz/base-av

MAINTAINER Tobias Suckow <tobias@suckow.biz>

ENV \
    # Conventionally named SUPERTUX USER DIRECTORY
    SUPERTUX2_USER_DIR="/var/games/supertux2"
RUN mkdir -p "${SUPERTUX2_USER_DIR}"

RUN apt-get update && apt-get --quiet --assume-yes --no-install-recommends --auto-remove install \
    build-essential \
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

COPY context /
ENV ENTRYPOINT_GROUPS="audio,video"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/opt/supertux/build/supertux2", "--fullscreen"]
