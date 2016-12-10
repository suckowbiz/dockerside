#!/usr/bin/env bash
#
# Created to run more than one process.

readonly SQUID=`which squid3`
readonly TOR=`which tor`
readonly PRIVOXY=`which privoxy`

# start tor to "anonymously" send requests
TOR_OPTS=""
if [ ! "${TOR_EXCLUDE_EXIT_NODES}" = "" ]
then
    TOR_OPTS="ExcludeExitNodes ${TOR_EXCLUDE_EXIT_NODES}"
fi 
echo "Tor Opts: $TOR_OPTS"
/usr/bin/install -Z -m 02750 -o debian-tor -g debian-tor -d /var/run/tor
"${TOR}" --defaults-torrc /usr/share/tor/tor-service-defaults-torrc -f /etc/tor/torrc --RunAsDaemon 1 ${TOR_OPTS}

# start privoxy to filter spam and mediate http proxy to socks proxy
"${PRIVOXY}" --pidfile "/var/run/privoxy.pid" --user "privoxy" "/etc/privoxy/config"

mkdir --parent /var/spool/squid3
# start squid to have a caching http proxy
# -N	foreground
# -d1	log level 1
exec "${SQUID}" -N -d1
