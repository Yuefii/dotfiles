CHOICE=$(echo -e "Shutdown\nReboot\nLogout\nCancel" | wofi --dmenu --prompt "Power")

case "$CHOICE" in
Shutdown) systemctl poweroff ;;
Reboot) systemctl reboot ;;
Logout) swaymsg exit ;;
*) exit 0 ;;
esac
