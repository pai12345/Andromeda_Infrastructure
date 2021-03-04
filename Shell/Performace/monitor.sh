#!/bin/bash

function get_memcpu_usage() {
    local MEMPERCENT=$(ps -o uname,pid,%mem,%cpu,bsdstart,sig,sigcatch,sigignore,sigmask,fsgid,command ax --sort -%mem,-%cpu)
    if [[ $? -ne 0 ]]; then
        echo "Error for Memory & CPU calculation: $MEMPERCENT"
    else
        echo "$MEMPERCENT | sort"
    fi
}
get_memcpu_usage
