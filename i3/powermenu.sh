#!/bin/bash

OPTIONS=" Lock\n Logout\n Reboot\n Shutdown"

CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "Power Menu:" -theme ~/.config/rofi/powermenu.rasi)

case "$CHOICE" in
  " Lock")
        i3lock -i ~/Pictures/lockscreen/__03.png
        ;;
  " Logout")
        i3-msg exit
        ;;
  " Reboot")
        systemctl reboot
        ;;
  " Shutdown")
        systemctl poweroff
        ;;
esac

