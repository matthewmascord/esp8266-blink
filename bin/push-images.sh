#!/usr/bin/env bash
docker login && \
docker push "$DOCKERHUB_USERNAME"/esp8266-build:0.0.1 && \
docker push "$DOCKERHUB_USERNAME"/unity-test:0.0.1