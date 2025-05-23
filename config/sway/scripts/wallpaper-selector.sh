#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

SELECTED=$(find "$WALLPAPER_DIR" -type f -exec basename {} \; | wofi --dmenu --prompt "Pilih wallpaper")

if [ -n "$SELECTED" ]; then
    if [ -f /tmp/swaybg.pid ]; then
        kill $(cat /tmp/swaybg.pid)
        rm /tmp/swaybg.pid
    fi

    swaybg -i "$WALLPAPER_DIR/$SELECTED" -m fill &
    echo $! >/tmp/swaybg.pid
    notify-send "Wallpaper Diganti" "$SELECTED"
fi
