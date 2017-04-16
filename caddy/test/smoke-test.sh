#!/usr/bin/env bash

../caddy
sleep 1

readonly ACTUAL_RESULT=$(curl --silent localhost:2015)
readonly EXPECTED_RESULT='401 Unauthorized'
readonly TEST_RESULT=$(echo "${ACTUAL_RESULT}" |grep --silent "${EXPECTED_RESULT}" && echo $?)
if [[ "${TEST_RESULT}" = "0" ]]; then
    echo "Success: Requesting caddy returned expected: ${EXPECTED_RESULT}."
else
    echo "Failure: Requesting caddy did not return expected: ${EXPECTED_RESULT}."
fi
docker kill caddy