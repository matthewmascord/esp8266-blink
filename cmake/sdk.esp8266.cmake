set(ESP8266_SDK_BASE $ENV{ESP_SDK_ROOT})

find_library(ESP8266_SDK_LIB_C c ${XTENSA_TOOLCHAIN_ROOT}/xtensa-lx106-elf/sysroot/lib)
find_library(ESP8266_SDK_LIB_GCC gcc ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_AT at ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_CRYPTO crypto ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_ESPNOW espnow ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_JSON json ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_LWIP lwip ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_MAIN main ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_MESH mesh ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_NET80211 net80211 ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_PHY phy ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_PP pp ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_PWM pwm ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_SMARTCONFIG smartconfig ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_SSL ssl ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_WPA wpa ${ESP8266_SDK_BASE}/lib)
find_library(ESP8266_SDK_LIB_WPS wps ${ESP8266_SDK_BASE}/lib)

include_directories(${ESP8266_SDK_BASE}/include)

set(CMAKE_EXE_LINKER_FLAGS "-L${ESP8266_SDK_BASE}/ld -Teagle.app.v6.ld -nostdlib -Wl,--no-check-sections -u call_user_start -Wl,-static" CACHE STRING "linker flags" FORCE)
