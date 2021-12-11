#!/bin/bash
set -e
token=$(security find-generic-password -w -s 'Desk LEDs Webthings Bearer Token' -a 'parente')

state=$(curl -H "Authorization: Bearer ${token}" \
  -H "Accept: application/json" \
  --silent \
  https://things.parente.dev/things/zwave-cc4a169f-13/properties/on)

if [ $state == '{"on":true}' ]; then
    value='false'
else
    value='true'
fi

curl -H "Authorization: Bearer ${token}" \
  -H "Accept: application/json" \
  -H 'Content-Type: application/json' \
  -X PUT \
  -d '{"on":'${value}'}' \
  --silent \
  https://things.parente.dev/things/zwave-cc4a169f-13/properties/on