FROM suckowbiz/base

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

# Conventionally named SUPERTUX USER DIRECTORY
ENV SUPERTUX2_USER_DIR="/var/lib/supertux2"

RUN apt-get update --quiet \
 && apt-get --quiet --quiet --yes --no-install-recommends install \
    automake \
    build-essential \
    cmake \
    git \
    libboost-all-dev \
    libcurl4-openssl-dev \
    libfreetype6-dev \
    libfribidi-dev \
    libglew-dev \
    libopenal-dev \
    libogg-dev \
    libphysfs-dev \
    libpng-dev \
    libraqm-dev \
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
