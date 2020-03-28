# CMake ESP8266

This guide assumes running MacOS.

Set ESP_SDK_ROOT in your environment:

For example,

```
echo export ESP_SDK_ROOT=/Volumes/case-sensitive/esp-open-sdk >> ~/.zshenv
echo export PATH=${ESP_SDK_ROOT}/xtensa-lx106-elf/bin:$PATH >> ~/.zshenv
```

To run:

```
mkdir -p build
cd build
rm -rf *
cmake -DCMAKE_TOOLCHAIN_FILE=../cmake/toolchain.ESP8266.cmake ..
cmake --build . --verbose --target flash
```