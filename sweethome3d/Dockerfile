FROM suckowbiz/base-av
LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV USER_DATA_DIR="/var/lib/sh3d" \
    VERSION_SH3D="7.1"

ENV PATH="$PATH:/opt/SweetHome3D-${VERSION_SH3D}-portable/"

RUN apt-get install --quiet --quiet \
  p7zip-full

RUN curl -fL https://sourceforge.net/projects/sweethome3d/files/SweetHome3D/SweetHome3D-${VERSION_SH3D}/SweetHome3D-${VERSION_SH3D}-portable.7z/download -o file.7z \
 && 7z x -y file.7z -o/opt -r

WORKDIR /etc/skel
RUN ln --symbolic "${USER_DATA_DIR}" SweetHome3D

VOLUME ["${USER_DATA_DIR}"]

WORKDIR "${USER_DATA_DIR}"
ENTRYPOINT ["/entrypoint.sh", "SweetHome3D-linux-x64"]
