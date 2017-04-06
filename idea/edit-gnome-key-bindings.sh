#!/usr/bin/env bash
#
# Restores (invoke with 'restore') or disables (invoke with 'disable') GNOME key bindings that overlay Idea ones.
# (Tip: List bindings e.g. via 'gsettings list-recursively org.gnome.settings-daemon.plugins.media-keys')

#######################################
# Restores GNOME key binding
# Globals:
# Arguments:
#  $1 schema name
#  $2 key name
# Returns:
#   None
#######################################
restore_gnome_binding() {
    CURRENT_VALUE=$(gsettings get "$1" "$2")
    gsettings reset "$1" "$2"
    RESET_VALUE=$(gsettings get "$1" "$2")
    echo "Reset '$2' from $CURRENT_VALUE to $RESET_VALUE ..."
}

#######################################
# Disables GNOME key binding
# Globals:
# Arguments:
#  $1 schema name
#  $2 key name
# Returns:
#   None
#######################################
disable_gnome_binding() {
    CURRENT_VALUE=$(gsettings get "$1" "$2")
    echo "Setting '$2' from $CURRENT_VALUE to '' ..."
    gsettings set "$1" "$2" ''
}

declare -A SCHEMAS_AND_KEYS
# Ctrl+Alt+L -> GNOME: 'screensaver' IDEA: 'Reformat Code'
SCHEMAS_AND_KEYS[org.gnome.settings-daemon.plugins.media-keys]=screensaver

for SCHEMA in "${!SCHEMAS_AND_KEYS[@]}"
do
    if [ "$1" = 'disable' ]
    then
        disable_gnome_binding $SCHEMA ${SCHEMAS_AND_KEYS[$SCHEMA]}
    elif [ "$1" = 'restore' ]
    then
        restore_gnome_binding $SCHEMA ${SCHEMAS_AND_KEYS[$SCHEMA]}
    else
        echo Invoke with: "$0" [--disable|--restore] to mute or reset gnome key bindings that overlay with idea ones.
        exit 0
    fi
done