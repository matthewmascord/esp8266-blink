#!/usr/bin/env bash
mkdir -p build-release && \
cd build-release && \
cmake \
  -DCMAKE_TOOLCHAIN_FILE=cmake/toolchain.esp8266.cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DTARGET_GROUP=release \
  --verbose .. && \
cmake --build . --target firmware_binary --verbose
