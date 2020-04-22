#!/usr/bin/env bash
cd build-release && \
cmake --build . --target flash --verbose
