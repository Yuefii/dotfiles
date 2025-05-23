#!/bin/bash

THEME_DIR="$HOME/.config/sway/themes"
KITTY_THEME_DIR="$HOME/.config/kitty/themes"
WAYBAR_THEME_DIR="$HOME/.config/waybar/themes"

TARGET_THEME="$HOME/.config/sway/theme.conf"
TARGET_KITTY="$HOME/.config/kitty/current-theme.conf"
TARGET_WAYBAR="$HOME/.config/waybar/style.css"

theme=$(ls "$THEME_DIR" | sort | wofi --dmenu --prompt "Pilih Tema")

[ -z "$theme" ] && exit 0

cp "$THEME_DIR/$theme/config" "$TARGET_THEME"

if [ -f "$KITTY_THEME_DIR/$theme.conf" ]; then
    cp "$KITTY_THEME_DIR/$theme.conf" "$TARGET_KITTY"
fi

if [ -f "$WAYBAR_THEME_DIR/$theme.css" ]; then
    cp "$WAYBAR_THEME_DIR/$theme.css" "$TARGET_WAYBAR"
    pkill waybar && waybar &
fi

swaymsg reload
pkill -SIGUSR1 kitty
notify-send "Sway Theme" "Tema '$theme' telah diterapkan!"
