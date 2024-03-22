#!/bin/sh
yad --title=:"BSPWM Keybindings" \
	--no-buttons --geometry=500x400-20-450 --list --column=keys: --column=description: --column=command: "ESC" "close this app" "" \
	"=" "modkey" "(set mod Mod4)" \
	"+enter" "open a terminal" "" \
	"+f" "open Browser" "" \
	"+e" "open Filebrowser" "" \
	"+SPACE" "app menu" "(rofi)" \
	"+q" "close focused app" \
	"(kill)" "Print-key" "screenshot" "(scrot)" \
	"+Shift+e" "logout menu" "(rofi)" \
	"+F1" "open keybinding helper" "full list" \
	"+Alt+r" "reload bspwm" "bpsc restart" \
	"+ESC" "reload sxhkd" "pkill -USR1 -x sxhkd" \
	"+" "" \
	"+" "" \
	"+" "" \
	"+" "" \
	"+" "" \
	"+" "" \
	"+" "" \
	"+" "" \
	"+" "" \
	"+" "" \
	"+" "" \
	"+" "" \
	"+" ""
