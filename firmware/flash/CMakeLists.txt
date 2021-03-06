set(ESP8266_ESPTOOL $ENV{ESP8266_ESPTOOL})
set(ESP8266_ESPTOOL_COM_PORT /dev/cu.SLAB_USBtoUART CACHE STRING "COM port to be used by esptool")
set(ESP8266_ESPTOOL_BAUD 230400 CACHE STRING "Baud rate to be used by esptool")

set(FW_ADDR_1 0x00000)
set(FW_ADDR_2 0x10000)

add_custom_target(
        firmware_binary ALL
        COMMAND ${ESP8266_ESPTOOL} elf2image --flash_size 4MB -o firmware_ $<TARGET_FILE:firmware>
)
set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES "firmware_${FW_ADDR_1}.bin firmware_${FW_ADDR_2}.bin")

add_dependencies(firmware_binary firmware)

add_custom_target(flash COMMAND ${ESP8266_ESPTOOL} --port ${ESP8266_ESPTOOL_COM_PORT} --baud ${ESP8266_ESPTOOL_BAUD} write_flash ${FW_ADDR_1} firmware_${FW_ADDR_1}.bin ${FW_ADDR_2} firmware_${FW_ADDR_2}.bin)

add_dependencies(flash firmware_binary)
