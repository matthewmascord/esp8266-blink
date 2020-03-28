set(CMAKE_SYSTEM_NAME ESP8266)
set(CMAKE_SYSTEM_VERSION 1)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/Modules")

set(CMAKE_C_COMPILER $ENV{ESP_SDK_ROOT}/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc)
set(CMAKE_CXX_COMPILER $ENV{ESP_SDK_ROOT}/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc)

set(CMAKE_C_FLAGS "-Og -g -Wpointer-arith -Wundef -w -Wl,-EL -fno-inline-functions -nostdlib -mlongcalls -mtext-section-literals -D__ets__ -DICACHE_FLASH -ggdb" CACHE STRING "C compiler flags" FORCE)
#set(CMAKE_C_FLAGS "-Os -g -O2 -Wpointer-arith -Wundef -w -Wl,-EL -fno-inline-functions -nostdlib -mlongcalls -mtext-section-literals -D__ets__ -DICACHE_FLASH -pipe" CACHE STRING "C compiler flags" FORCE)
set(CMAKE_CXX_FLAGS "-w -Os -g -D__ets__ -DICACHE_FLASH -mlongcalls -mtext-section-literals -fno-exceptions -fno-rtti -falign-functions=4 -std=c++11 -MMD -ffunction-sections -fdata-sections" CACHE STRING "CXX compiler flags" FORCE)
set(CMAKE_EXE_LINKER_FLAGS "-L$ENV{ESP_SDK_ROOT}/sdk/ld -Teagle.app.v6.ld -nostdlib -Wl,--no-check-sections -u call_user_start -Wl,-static" CACHE STRING "linker flags" FORCE)

set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_C_COMPILER> <FLAGS> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> -o <TARGET> -Wl,--start-group <OBJECTS> <LINK_LIBRARIES> -Wl,--end-group" CACHE STRING "C linker invocation")
set(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_CXX_COMPILER> <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> -o <TARGET> -Wl,--start-group <OBJECTS> <LINK_LIBRARIES> -Wl,--end-group" CACHE STRING "CXX linker invocation")
