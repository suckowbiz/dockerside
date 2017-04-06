FROM suckowbiz/base

LABEL maintainer=tobias@suckow.biz \
      name=base

RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update \
 && apt-get install --assume-yes --no-install-recommends --auto-remove \
    python \
    ansible
