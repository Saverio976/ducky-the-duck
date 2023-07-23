#!/bin/bash

NORMAL='\e[0m'
BOLD='\e[1m'
GREEN='\e[32m'
RED='\e[31m'

function info_os() {
    if [ -z "$(echo /etc/*-release)" ]; then
        echo -e "${RED}- OS: (no info)${NORMAL}"
        return
    fi

    echo -e "${GREEN}- OS:${NORMAL}"
    for FILE in /etc/*-release; do
        content="$(<"$FILE")"
        if [ -n "$content" ]; then
            echo "$content"
        fi
    done
}

function info_cpu() {
    if [ ! -f "/proc/cpuinfo" ]; then
        echo -e "${RED}- CPU: (no info)${NORMAL}"
        return
    fi

    echo -e "${GREEN}- CPU:${NORMAL}"
    grep "model name" < /proc/cpuinfo | uniq -c
}

function info_kernel() {
    if [ ! -f "/proc/version" ]; then
        echo -e "${RED}- Kernel: (no info)${NORMAL}"
        return
    fi
    echo -e "${GREEN}- Kernel:${NORMAL}"
    echo "$(<"/proc/version")"
}

function info_shell() {
    if [ -z "$CURRENT_SHELL" ]; then
        export CURRENT_SHELL=''
        CURRENT_SHELL=$(readlink /proc/$$/exe)
        [[ "$CURRENT_SHELL" == *"zsh"* ]] && CURRENT_SHELL="zsh"
        [[ "$CURRENT_SHELL" == *"bash"* ]] && CURRENT_SHELL="bash"
    fi
    if [ -z "$CONFIG_FILE" ]; then
        [ "$CURRENT_SHELL" = "zsh" ] && CONFIG_FILE="${ZDOTDIR:-$HOME}/.zshrc"
        [ "$CURRENT_SHELL" = "bash" ] && CONFIG_FILE="$HOME/.bashrc"
    fi
    echo -e "${GREEN}- Shell:${NORMAL}"
    echo "- - Program: $CURRENT_SHELL"
    echo "- - Config File: ${CONFIG_FILE}"
}

function info_memory() {
    if ! command -v free &>/dev/null; then
        echo -e "${RED}- Memory: (no info)${NORMAL}"
        return
    fi
    echo -e "${GREEN}- Memory:${NORMAL}"
    if command -v awk &>/dev/null; then
        echo "- - Used: $(free | awk '/Mem/{printf("%.2f%"), $3/$2*100}')"
    fi
    free -h
}

function main() {
    echo -e "${BOLD}-- Info --${NORMAL}"

    info_shell
    info_os
    info_kernel
    info_cpu
    info_memory
}

main
