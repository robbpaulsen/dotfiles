#!/usr/env/bin bash

#this script swaps 7 desktops of the first en second monitor and also swaps their names.

src_desktop_name=“$(bspc query -D -d ‘^1:^1’ --names)” || exit 1
dst_desktop_name=“$(bspc query -D -d ‘^2:^1’ --names)” || exit 1
bspc desktop ‘^1:^1’ -n “$dst_desktop_name” -s ‘^2:^1’
bspc desktop ‘^1:^1’ -n “$src_desktop_name”

src_desktop_name=“$(bspc query -D -d ‘^1:^2’ --names)” || exit 1
dst_desktop_name=“$(bspc query -D -d ‘^2:^2’ --names)” || exit 1
bspc desktop ‘^1:^2’ -n “$dst_desktop_name” -s ‘^2:^2’
bspc desktop ‘^1:^2’ -n “$src_desktop_name”

src_desktop_name=“$(bspc query -D -d ‘^1:^3’ --names)” || exit 1
dst_desktop_name=“$(bspc query -D -d ‘^2:^3’ --names)” || exit 1
bspc desktop ‘^1:^3’ -n “$dst_desktop_name” -s ‘^2:^3’
bspc desktop ‘^1:^3’ -n “$src_desktop_name”

src_desktop_name=“$(bspc query -D -d ‘^1:^4’ --names)” || exit 1
dst_desktop_name=“$(bspc query -D -d ‘^2:^4’ --names)” || exit 1
bspc desktop ‘^1:^4’ -n “$dst_desktop_name” -s ‘^2:^4’
bspc desktop ‘^1:^4’ -n “$src_desktop_name”

src_desktop_name=“$(bspc query -D -d ‘^1:^5’ --names)” || exit 1
dst_desktop_name=“$(bspc query -D -d ‘^2:^5’ --names)” || exit 1
bspc desktop ‘^1:^5’ -n “$dst_desktop_name” -s ‘^2:^5’
bspc desktop ‘^1:^5’ -n “$src_desktop_name”

src_desktop_name=“$(bspc query -D -d ‘^1:^6’ --names)” || exit 1
dst_desktop_name=“$(bspc query -D -d ‘^2:^6’ --names)” || exit 1
bspc desktop ‘^1:^6’ -n “$dst_desktop_name” -s ‘^2:^6’
bspc desktop ‘^1:^6’ -n “$src_desktop_name”

src_desktop_name=“$(bspc query -D -d ‘^1:^7’ --names)” || exit 1
dst_desktop_name=“$(bspc query -D -d ‘^2:^7’ --names)” || exit 1
bspc desktop ‘^1:^7’ -n “$dst_desktop_name” -s ‘^2:^7’
bspc desktop ‘^1:^7’ -n “$src_desktop_name”
