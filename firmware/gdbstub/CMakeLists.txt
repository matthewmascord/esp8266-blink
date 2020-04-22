add_library(gdbstub
        gdbstub-cfg.h
        gdbstub-entry.h
        gdbstub-entry.S
        gdbstub.c
        gdbstub.h)

# This is needed to include the user_config.h file when compiling gdbstub
include_directories("../../src" ${ESP8266_SDK_BASE}/include)

target_include_directories(gdbstub PUBLIC "${CMAKE_CURRENT_LIST_DIR}")
