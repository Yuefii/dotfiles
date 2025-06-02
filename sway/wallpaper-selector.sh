#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
DEFAULT_WALLPAPER="$HOME/.config/sway/default.jpg"

SELECTED=$(find "$WALLPAPER_DIR" -type f -exec basename {} \; | wofi --dmenu --prompt "Pilih wallpaper")

if [ -z "$SELECTED" ]; then
    WALLPAPER="$DEFAULT_WALLPAPER"
else
    WALLPAPER="$WALLPAPER_DIR/$SELECTED"
fi

if [ -f /tmp/swaybg.pid ]; then
    kill $(cat /tmp/swaybg.pid)
    rm /tmp/swaybg.pid
fi

swaybg -i "$WALLPAPER" -m fill &
echo $! >/tmp/swaybg.pid
notify-send "Wallpaper Diganti" "$(basename "$WALLPAPER")"
