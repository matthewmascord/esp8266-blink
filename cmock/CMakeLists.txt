add_library(cmock
        CMock/src/cmock.c)
include_directories(CMock/vendor/Unity/src)
target_include_directories(cmock PUBLIC
        CMock/src)