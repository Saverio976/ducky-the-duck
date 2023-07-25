#!/bin/bash

if [ -z "$CONFIGFILE" ]; then
    exit 1
fi

echo "echo 'sleep 0.1' >> $CONFIGFILE" >> "$CONFIGFILE"
echo "sleep 0.1" >> "$CONFIGFILE"
