#!/bin/bash

if [ -z "$CONFIG_FILE" ]; then
    exit 1
fi

{
    echo "alias code=vim";
    echo "alias nano=vim";
    echo "alias emacs=vim"
} >> "$CONFIG_FILE"
