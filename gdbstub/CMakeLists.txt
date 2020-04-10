add_library(gdbstub
    gdbstub-cfg.h
    gdbstub-entry.h
    gdbstub-entry.S
    gdbstub.c
    gdbstub.h)

# This is needed to include the user_config.h file when compiling gdbstub
include_directories("../src")