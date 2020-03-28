file cmake-build-debug/firmware.elf
set remotelogfile gdb_rsp_logfile.txt
set serial baud 115200
set remote hardware-breakpoint-limit 1
set remote hardware-watchpoint-limit 1
target remote /dev/cu.SLAB_USBtoUART
