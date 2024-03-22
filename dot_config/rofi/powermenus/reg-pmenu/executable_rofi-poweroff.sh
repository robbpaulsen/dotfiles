#!/usr/bin/env bash

rofi_poweroff_menu() {
	echo -e "Logout\nReboot\nShutdown" | rofi -c $HOME/.config/rofi/pmenu.rasi -font "Iosevka Bold 11" -show drun -show-icons -width 20 -l 3 -dmenu -i
}

chosen=$(rofi_poweroff_menu)

if [[ $chosen = "Logout" ]]; then
	bspc quit
elif [[ $chosen = "Shutdown" ]]; then
	systemctl poweroff
elif [[ $chosen = "Reboot" ]]; then
	systemctl reboot
fi