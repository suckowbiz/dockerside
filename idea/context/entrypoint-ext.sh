#!/usr/bin/env bash
#
# Intentionally added to write system settings.

# https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
sysctl --write fs.inotify.max_user_watches=524288
. /entrypoint.sh $@
