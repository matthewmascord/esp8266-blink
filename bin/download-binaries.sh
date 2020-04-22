#!/usr/bin/env bash
PROJECT=esp8266-blink
if [ -z "${CIRCLE_TOKEN}" ]; then
  echo "CIRCLE_TOKEN not set"
  exit 1
fi
if [ -z "${GITHUB_USERNAME}" ]; then
  echo "GITHUB_USERNAME not set"
  exit 1
fi
mkdir -p build-debug
ENDPOINT=https://circleci.com/api/v1.1/project/github/"$GITHUB_USERNAME"/$PROJECT
curl "$ENDPOINT"/latest/artifacts?circle-token="$CIRCLE_TOKEN" \
  | grep -o 'https://[^"]*' \
  | wget -v -i - -P build-debug
