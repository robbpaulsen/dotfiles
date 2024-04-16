#!/usr/bin/env bash

rofi_poweroff_menu() {
	echo -e "Logout\nReboot\nShutdown" | rofi -font "Iosevka Bold 11" -show drun -show-icons -width 20 -l 3 -dmenu -i -width 400 -lines 5 -yoffset 40
}

chosen=$(rofi_poweroff_menu)

if [[ $chosen = "Logout" ]]; then
	bspc quit
elif [[ $chosen = "Shutdown" ]]; then
	systemctl poweroff
elif [[ $chosen = "Reboot" ]]; then
	systemctl reboot
fi