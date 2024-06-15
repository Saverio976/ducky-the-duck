#!/bin/bash

if [ -z "$CONFIGFILE" ]; then
    exit 1
fi

echo "alias gcc='clang -Weverything'" >> "$CONFIGFILE"
