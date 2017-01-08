FROM suckowbiz/base
MAINTAINER Tobias Suckow <tobias@suckow.biz>

RUN apt-get install --quiet --yes --no-install-recommends \
    nginx \
    php-fpm \
    supervisor

RUN \
 # path expected for fpm socket
 mkdir --parent /var/run/php \
 # Secure php processor to disallow execution of closes script if requestet php can not be found.
 && sed --in-place "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php/7.0/fpm/php.ini \
 && sed --in-place "s/;daemonize = yes/daemonize = no/g" /etc/php/7.0/fpm/php-fpm.conf

RUN \
 # Increase timeout (will not affect all browsers) to have larger interval allowing more actions.
 sed --in-place "s/keepalive_timeout\s*65/keepalive_timeout 2/g" /etc/nginx/nginx.conf \
 # Setting client_max_body_size to 0 disables checking of client request body size.
 && sed --in-place "s/keepalive_timeout 2/keepalive_timeout 2;\n\tclient_max_body_size 0/g" /etc/nginx/nginx.conf \
 # NGINX must not run as daemon to avoid container stops right after start
 && echo "daemon off;" >> /etc/nginx/nginx.conf

COPY context /
ENV ENTRYPOINT_AS_ROOT=yes
ENTRYPOINT ["/entrypoint.sh", "/start.sh"]