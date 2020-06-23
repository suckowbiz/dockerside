#!/usr/bin/env bash
# Intentionally created to log out someting on a regular basis

trap "exit 0" SIGINT SIGTERM

while true; do
    date
    sleep 2
done