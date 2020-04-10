set(CMOCK ruby ${CMOCK_ROOT}/lib/cmock.rb -o${CMAKE_CURRENT_LIST_DIR}/cmock.yml)

add_custom_command(OUTPUT Mockets_sys.c COMMAND ${CMOCK} ${CMAKE_CURRENT_LIST_DIR}/ets_sys.h)
add_custom_command(OUTPUT Mockgdbstub.c COMMAND ${CMOCK} ${CMAKE_CURRENT_LIST_DIR}/gdbstub.h)
add_custom_command(OUTPUT Mockgpio.c COMMAND ${CMOCK} ${CMAKE_CURRENT_LIST_DIR}/gpio.h)
add_custom_command(OUTPUT Mockosapi.c COMMAND ${CMOCK} ${CMAKE_CURRENT_LIST_DIR}/osapi.h)

add_library(mocks
        Mockets_sys.c
        Mockgdbstub.c
        Mockgpio.c
        Mockosapi.c)

target_link_libraries(mocks cmock unity)

target_include_directories(mocks PUBLIC "${CMAKE_CURRENT_LIST_DIR}" "${CMAKE_CURRENT_BINARY_DIR}")
