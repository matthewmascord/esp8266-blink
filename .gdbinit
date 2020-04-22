set verbose on
set serial baud 115200
set remote hardware-breakpoint-limit 1
set remote hardware-watchpoint-limit 1

# Add source directory to source search path for debugging
# Needed if compilation happens on different machine e.g. CI
directory src
directory firmware/gdbstub

# The following hook is the magic that makes it work in CLion
# Inspired by this stackoverflow post on a different issue:
# https://stackoverflow.com/questions/39810593/gdb-monitor-commands-in-clion/39828850#39828850
# It seems CLion is not able to cope with the initial break on init set by the gdbstub
# It also does not work if any breakpoints are set in advance in the IDE.
# This ensures there is an initial breakpoint set that CLion can work with
# We have to set a hardware breakpoint as it's not possible to set a software
# breakpoint in flash
define target hookpost-remote
    hbreak EnablePins
end