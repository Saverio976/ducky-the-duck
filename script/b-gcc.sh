#!/bin/bash

if [ -z "$CONFIG_FILE" ]; then
    exit 1
fi

echo "alias gcc='clang -Weverything'" >> "$CONFIG_FILE"
