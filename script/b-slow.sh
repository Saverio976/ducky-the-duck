#!/bin/bash

if [ -z "$CONFIG_FILE" ]; then
    exit 1
fi

echo "echo 'sleep 0.1' >> $CONFIG_FILE" >> "$CONFIG_FILE"
echo "sleep 0.1" >> "$CONFIG_FILE"
