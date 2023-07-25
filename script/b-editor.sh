#!/bin/bash

if [ -z "$CONFIGFILE" ]; then
    exit 1
fi

{
    echo "alias code=vim";
    echo "alias nano=vim";
    echo "alias emacs=vim"
} >> "$CONFIGFILE"
