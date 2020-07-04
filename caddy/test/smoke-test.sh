#!/usr/bin/env bash
set -e

readonly HERE=$(dirname "$(readlink -f "$0")")
cd $HERE
../caddy
sleep 1

readonly ACTUAL_RESULT=$(curl --silent --output /dev/null --write-out "%{http_code}" localhost:2015)
readonly EXPECTED_RESULT='401'
if [[ "${ACTUAL_RESULT}" = "${EXPECTED_RESULT}" ]]; then
    echo "Success: Requesting caddy returned expected: ${EXPECTED_RESULT}."
else
    echo "Failure: Requesting caddy did not return expected: ${EXPECTED_RESULT}."
fi
docker kill caddy
