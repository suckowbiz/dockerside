#!/usr/bin/env bash
#
# Intentionally added to increase inode count.
sysctl -w fs.inotify.max_user_watches=524288
/entrypoint.sh goland.sh