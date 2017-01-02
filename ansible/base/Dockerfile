FROM suckowbiz/base

MAINTAINER Tobias Suckow <tobias@suckow.biz>

RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update \
 && apt-get install --assume-yes --no-install-recommends --auto-remove \
    python \
    ansible
