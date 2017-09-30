FROM suckowbiz/base-av

RUN dpkg --add-architecture i386 \
 && apt-get update \
 && apt-get upgrade -y \
 && apt-get install --yes libpulse0:i386 multiarch-support pavucontrol sni-qt:i386\
 && apt-get update

RUN curl \
    --remote-name \
    --fail \
    http://archive.canonical.com/ubuntu/pool/partner/s/skype/skype-bin_4.3.0.37-0ubuntu0.12.04.1_i386.deb \
 && dpkg --install skype-bin_4.3.0.37-0ubuntu0.12.04.1_i386.deb 2>/dev/null || true \
 && apt-get --fix-broken install --yes

 RUN ln --symbolic /Skype /etc/skel/.Skype
 VOLUME [ "/Skype" ]

ENV ENTRYPOINT_GROUPS="audio,video"
ENTRYPOINT ["/entrypoint.sh", "skype", "--disable-api"]