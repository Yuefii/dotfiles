#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpaper/"

SELECTED=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) |
    while read -r img; do
        echo -en "$img\x00icon\x1f$img\n"
    done | rofi -dmenu -theme "$HOME/.config/rofi/wallmenu.rasi" -markup-rows)

if [ -n "$SELECTED" ]; then
    feh --bg-fill "$SELECTED"
fi
