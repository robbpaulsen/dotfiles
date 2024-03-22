#!/usr/bin/env bash

src_desktop_name=“$(bspc query -D -d ‘^1:^2’ --names)” || exit 1
dst_desktop_name=“$(bspc query -D -d ‘^2:^2’ --names)” || exit 1
bspc desktop ‘^1:^2’ -n “$dst_desktop_name” -s ‘^2:^2’
bspc desktop ‘^1:^2’ -n “$src_desktop_name”
