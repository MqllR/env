#!/bin/sh
# Toggle window gaps on/off (sway's built-in `gaps ... toggle` is unreliable here)
state="${XDG_RUNTIME_DIR:-/tmp}/sway-gaps-off"
if [ -e "$state" ]; then
    rm "$state"
    swaymsg 'gaps inner all set 10; gaps outer all set 5'
else
    touch "$state"
    swaymsg 'gaps inner all set 0; gaps outer all set 0'
fi
