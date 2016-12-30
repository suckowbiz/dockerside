FROM suckowbiz/base

MAINTAINER Tobias Suckow <tobias@suckow.biz>

RUN apt-get install --assume-yes --no-install-recommends --auto-remove \
    openssh-server \
    python

RUN mkdir --parent /var/run/sshd \
 && sed --in-place "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" /etc/ssh/sshd_config \
 && sed --in-place "s/PermitRootLogin prohibit-password/PermitRootLogin no/g" /etc/ssh/sshd_config \
 && useradd --create-home --groups root --password $(perl -e'print crypt("ansible", "salt")') ansible

EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
