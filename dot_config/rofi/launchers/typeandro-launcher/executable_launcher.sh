#!/usr/bin/env bash

## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
dir="$HOME/.config/rofi/launchers/typeandro-launcher"
theme="properties"

## Run
rofi \
	-show drun \
	-theme ${dir}/${theme}.rasi
