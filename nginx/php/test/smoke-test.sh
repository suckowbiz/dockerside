#!/usr/bin/env bash

readonly HERE=$(dirname "$(readlink -f "$0")")
cd $HERE
../nginx-php
sleep 2

readonly ACTUAL_RESULT=$(curl --HEAD --silent --write-out "%{http_code}" --output /dev/null localhost/index.php)
readonly EXPECTED_RESULT='200'
if [[ "${EXPECTED_RESULT}" = "${ACTUAL_RESULT}" ]]; then
    echo "Success."
else
    echo "Failure: ${ACTUAL_RESULT} != ${EXPECTED_RESULT}."
fi
docker kill nginx-php