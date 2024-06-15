#!/bin/bash

nohup bash -c "while true; do xrandr --output eDP-1  --gamma 1.0:0.1:0.1; sleep 2; xrandr --output eDP-1  --gamma 0.1:1.0:0.1; sleep 2; xrandr --output eDP-1  --gamma 0.1:0.1:1.0; sleep 2; done" & disown
