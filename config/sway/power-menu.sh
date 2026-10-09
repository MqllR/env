#!/bin/bash
# Session menu via rofi
choice=$(printf '󰌾  Lock\n󰍃  Logout\n󰒲  Suspend\n󰜉  Reboot\n󰐥  Shutdown' | rofi -dmenu -i -p "session" -lines 5)
case "$choice" in
  *Lock)     swaylock -f -c 1e1e2e ;;
  *Logout)   swaymsg exit ;;
  *Suspend)  systemctl suspend ;;
  *Reboot)   systemctl reboot ;;
  *Shutdown) systemctl poweroff ;;
esac
