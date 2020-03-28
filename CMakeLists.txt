cmake_minimum_required(VERSION 3.15)
include(cmake/esp8266.cmake)

project(esp_xcode C ASM)

include_directories(user)
add_subdirectory(gdbstub)

link_directories($ENV{ESP_SDK_ROOT}/sdk/lib)
add_executable(firmware
        user/main.c
        user/user_config.h)

target_link_libraries(firmware
        c
        gcc
        hal
        lwip
        main
        net80211
        phy
        pp
        wpa
        gdbstub
        )

include(cmake/flash.cmake)