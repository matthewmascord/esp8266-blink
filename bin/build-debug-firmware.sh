#!/usr/bin/env bash
mkdir -p build-debug && \
cd build-debug && \
cmake \
  -DCMAKE_TOOLCHAIN_FILE=cmake/toolchain.esp8266.cmake \
  -DCMAKE_BUILD_TYPE=Debug \
  -DTARGET_GROUP=release \
  --verbose .. && \
cmake --build . --target firmware
