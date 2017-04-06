FROM suckowbiz/ansible-base

LABEL maintainer=tobias@suckow.biz \
      name=base

WORKDIR /opt
ENTRYPOINT ["/entrypoint.sh", "ansible-playbook"]
CMD ["--help"]
