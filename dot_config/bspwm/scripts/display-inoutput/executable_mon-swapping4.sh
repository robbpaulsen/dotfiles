#!/usr/bin/env bash

src_desktop_name=“$(bspc query -D -d ‘^1:^4’ --names)” || exit 1
dst_desktop_name=“$(bspc query -D -d ‘^2:^4’ --names)” || exit 1
bspc desktop ‘^1:^4’ -n “$dst_desktop_name” -s ‘^2:^4’
bspc desktop ‘^1:^4’ -n “$src_desktop_name”
