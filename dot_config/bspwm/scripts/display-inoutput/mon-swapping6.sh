#!/usr/bin/env bash

src_desktop_name=“$(bspc query -D -d ‘^1:^6’ --names)” || exit 1
dst_desktop_name=“$(bspc query -D -d ‘^2:^6’ --names)” || exit 1
bspc desktop ‘^1:^6’ -n “$dst_desktop_name” -s ‘^2:^6’
bspc desktop ‘^1:^6’ -n “$src_desktop_name”
