FROM ubuntu:19.10

WORKDIR /

RUN apt-get update && apt-get install -y git cmake make python3.6 python3-pip

RUN pip3 install esptool

ADD xtensa-lx106-elf.tar.gz .

RUN git clone --branch v3.0.3 https://github.com/espressif/ESP8266_NONOS_SDK.git

ENV ESP_SDK_ROOT /ESP8266_NONOS_SDK

ENV XTENSA_TOOLCHAIN_ROOT /xtensa-lx106-elf

ENV ESP8266_ESPTOOL /usr/local/bin/esptool.py
