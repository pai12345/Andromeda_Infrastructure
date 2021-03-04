#!/bin/bash

function get_memcpu_usage() {
    if [[ -z "$1" ]]; then
        local MEMPERCENT=$(ps -o uname,pid,%mem,%cpu,bsdstart,sig,sigcatch,sigignore,sigmask,fsgid,command ax --sort -%mem,-%cpu)
        if [[ $? -ne 0 ]]; then
            echo "error: $MEMPERCENT"
            exit 1
        fi
    else
        local MEMPERCENT=$(ps -u "$1" -o uname,pid,%mem,%cpu,bsdstart,sig,sigcatch,sigignore,sigmask,fsgid,command ax --sort -%mem,-%cpu | grep "$1")
        if [[ $? -ne 0 ]]; then
            echo "error: $MEMPERCENT"
            exit 1
        fi
    fi
    echo "$MEMPERCENT | sort"
}

if [[ $# -eq 0 ]]; then
    get_memcpu_usage
elif [[ $# -gt 1 ]]; then
    echo "Enter single user name"
    exit 1
else
    get_memcpu_usage $1
fi
