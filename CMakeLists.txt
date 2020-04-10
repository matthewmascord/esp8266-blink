cmake_minimum_required(VERSION 3.15)
project(esp8266-blink C ASM)

set(UNITY_HOME ${CMAKE_CURRENT_LIST_DIR}/Unity)
set(CMOCK_ROOT ${CMAKE_CURRENT_LIST_DIR}/cmock/CMock)
set(TARGET_GROUP release CACHE STRING "Group to build")

if(TARGET_GROUP STREQUAL release)
    add_subdirectory(gdbstub)

    add_executable(firmware
            src/main.c
            src/main.h
            src/user_config.h)

    target_include_directories(firmware PUBLIC src)

    include(cmake/flash.cmake)
elseif(TARGET_GROUP STREQUAL test)
    include(cmake/test.cmake)
    include(CTest)
    add_subdirectory(Unity)
    add_subdirectory(cmock)
    add_subdirectory(test)
else()
    message(FATAL_ERROR "I don't know the TARGET_GROUP you gave me!")
endif()

