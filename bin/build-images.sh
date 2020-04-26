#!/usr/bin/env bash
$(cd .circleci/images/default && PROJECT=esp-open-sdk ../../../bin/download-binaries.sh) && \
docker build -t "$DOCKERHUB_USERNAME"/esp8266-build:0.0.1 .circleci/images/default && \
docker build -t "$DOCKERHUB_USERNAME"/unity-test:0.0.1 .circleci/images/test
