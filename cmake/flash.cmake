set(ESP8266_ESPTOOL /usr/local/bin/esptool.py)
set(ESP8266_ESPTOOL_COM_PORT /dev/cu.SLAB_USBtoUART CACHE STRING "COM port to be used by esptool")
set(ESP8266_ESPTOOL_BAUD 230400 CACHE STRING "Baud rate to be used by esptool")

set(FW_ADDR_1 0x00000)
set(FW_ADDR_2 0x10000)

find_library(ESP8266_SDK_LIB_C c ${ESP8266_SDK_BASE}/lib)
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

target_link_libraries(firmware
        ${ESP8266_SDK_LIB_C}
        ${ESP8266_SDK_LIB_GCC}
        ${ESP8266_SDK_LIB_LWIP}
        ${ESP8266_SDK_LIB_MAIN}
        ${ESP8266_SDK_LIB_NET80211}
        ${ESP8266_SDK_LIB_PHY}
        ${ESP8266_SDK_LIB_PP}
        ${ESP8266_SDK_LIB_WPA}
        gdbstub
        )

add_custom_target(
        firmware_binary ALL
        COMMAND ${ESP8266_ESPTOOL} elf2image --flash_size 4MB -o firmware_ firmware.elf
)
set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES "firmware_${FW_ADDR_1}.bin firmware_${FW_ADDR_2}.bin")

add_dependencies(firmware_binary firmware)

add_custom_target(flash COMMAND ${ESP8266_ESPTOOL} --port ${ESP8266_ESPTOOL_COM_PORT} --baud ${ESP8266_ESPTOOL_BAUD} write_flash ${FW_ADDR_1} firmware_${FW_ADDR_1}.bin ${FW_ADDR_2} firmware_${FW_ADDR_2}.bin)

add_dependencies(flash firmware_binary)
