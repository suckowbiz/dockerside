#!/usr/bin/env bash
#
# Intentionally added to override entrypoint.sh to enable post processing of user names.

# Set the nginx workers user to preserver file rights.
sed --in-place "s/user www-data;/user ${GIVEN_USER} ${GIVEN_GROUP};/g" /etc/nginx/nginx.conf

exec "$@"
