#!/bin/bash

SQUID=`which squid3` 
TOR=`which tor`
PRIVOXY=`which privoxy`

# start tor to "anonymous" send requests to wwww
TOR_OPTS=""
if [ -n "$TOR_EXCLUDE_EXIT_NODES" ] 
then
    TOR_OPTS="ExcludeExitNodes $TOR_EXCLUDE_EXIT_NODES"
fi 
echo "Tor Opts: $TOR_OPTS"
/usr/bin/install -Z -m 02750 -o debian-tor -g debian-tor -d /var/run/tor
$TOR --defaults-torrc /usr/share/tor/tor-service-defaults-torrc -f /etc/tor/torrc --RunAsDaemon 1 $TOR_OPTS

# start privoxy to filter spam and mediate http proxy to socks proxy
PIDFILE=/var/run/privoxy.pid
OWNER=privoxy
CONFIGFILE=/etc/privoxy/config
$PRIVOXY --pidfile $PIDFILE --user $OWNER $CONFIGFILE

# start squid to have a caching http proxy
# -N	foreground
# -d1	log level 1
mkdir -p /var/spool/squid3
exec $SQUID -N -d1
