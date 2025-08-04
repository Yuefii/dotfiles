#!/bin/bash

WALLPAPER_DIR="$HOME/personal/wallpapers"
MONITOR=$(hyprctl monitors | grep "Monitor" | head -n1 | awk '{print $2}')

SELECTED=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) |
    while read -r img; do
        echo -en "$img\x00icon\x1f$img\n"
    done | rofi -dmenu -theme "$HOME/.config/rofi/main_wall.rasi" -markup-rows)

if [ -n "$SELECTED" ]; then
    CONFIG="$HOME/.config/hypr/hyprpaper.conf"
    echo "preload = $SELECTED" >"$CONFIG"
    echo "wallpaper = $MONITOR,$SELECTED" >>"$CONFIG"

    pkill hyprpaper
    hyprpaper &
fi
