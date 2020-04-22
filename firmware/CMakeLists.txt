include(../cmake/sdk.esp8266.cmake)

add_executable(firmware
        ../src/main.c
        ../src/main.h
        ../src/user_config.h)

target_include_directories(firmware PUBLIC ../src)

target_link_libraries(firmware
        ${ESP8266_SDK_LIB_C}
        ${ESP8266_SDK_LIB_GCC}
        ${ESP8266_SDK_LIB_LWIP}
        ${ESP8266_SDK_LIB_CRYPTO}
        ${ESP8266_SDK_LIB_MAIN}
        ${ESP8266_SDK_LIB_NET80211}
        ${ESP8266_SDK_LIB_PHY}
        ${ESP8266_SDK_LIB_PP}
        ${ESP8266_SDK_LIB_WPA}
        )

if (CMAKE_BUILD_TYPE STREQUAL Debug)
    add_subdirectory(gdbstub)
    target_link_libraries(firmware gdbstub)
endif()

add_subdirectory(flash)