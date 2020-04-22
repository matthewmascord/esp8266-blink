#!/usr/bin/env bash
mkdir -p build-test && \
cd build-test && \
cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DTARGET_GROUP=test \
  --verbose .. && \
cmake --build . --target test_meh_app && \
test/test_meh_app