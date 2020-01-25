#!/usr/bin/env bash
#
# Intentionally added to override entrypoint.sh to enable post processing of user names.

# Set the user php processor runs with to preserver file rights.
sed --in-place "s/user = www-data/user = ${GIVEN_USER}/g" /etc/php/7.3/fpm/pool.d/www.conf
sed --in-place "s/group = www-data/group = ${GIVEN_GROUP}/g" /etc/php/7.3/fpm/pool.d/www.conf
sed --in-place "s/listen.owner = www-data/listen.owner = ${GIVEN_USER}/g" /etc/php/7.3/fpm/pool.d/www.conf
sed --in-place "s/listen.group = www-data/listen.group = ${GIVEN_GROUP}/g" /etc/php/7.3/fpm/pool.d/www.conf

# Increase size of files allowed to upload since the default values are too small.
sed --in-place "s/upload_max_filesize = 2M/upload_max_filesize = ${MAX_FILESIZE:=100M}/g" /etc/php/7.3/fpm/php.ini
sed --in-place "s/post_max_size = 8M/post_max_size = ${MAX_FILESIZE:=100M}/g" /etc/php/7.3/fpm/php.ini

exec "$@"
