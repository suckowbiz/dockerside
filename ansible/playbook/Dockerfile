FROM suckowbiz/ansible-base

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV VOL_SSH="/volume/.ssh"

WORKDIR /etc/skel
RUN for volume in "${VOL_SSH}"; do ln --symbolic "${volume}"; done
VOLUME ["${VOL_SSH}", "/opt"]

WORKDIR /opt
ENTRYPOINT ["/entrypoint.sh", "ansible-playbook"]
CMD ["--help"]
