#!/bin/bash

THEME_DIR="$HOME/.config/sway/themes"
KITTY_THEME_DIR="$HOME/.config/kitty/themes"
WAYBAR_THEME_DIR="$HOME/.config/waybar/themes"
WOFI_THEME_DIR="$HOME/.config/wofi/themes"
MAKO_THEME_DIR="$HOME/.config/mako/themes"

TARGET_THEME="$HOME/.config/sway/theme.conf"
TARGET_KITTY="$HOME/.config/kitty/current-theme.conf"
TARGET_WAYBAR="$HOME/.config/waybar/style.css"
TARGET_WOFI="$HOME/.config/wofi/style.css"
TARGET_MAKO="$HOME/.config/mako/config"

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

if [ -f "$WOFI_THEME_DIR/$theme.css" ]; then
    cp "$WOFI_THEME_DIR/$theme.css" "$TARGET_WOFI"
fi

if [ -f "$MAKO_THEME_DIR/$theme.conf" ]; then
    cp "$MAKO_THEME_DIR/$theme.conf" "$TARGET_MAKO"
    pkill -SIGUSR1 mako 2>/dev/null || mako &
fi

swaymsg reload
pkill -SIGUSR1 kitty
notify-send "Sway Theme" "Tema '$theme' telah diterapkan!"
