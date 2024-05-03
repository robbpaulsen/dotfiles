#!/usr/bin/env bash

DIR="$HOME/.config/polybar.old/config.ini"

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar mainbar -c "$DIR" 2>&1 | tee -a /tmp/mainbar.log &
disown
#polybar network -c "$DIR/network.ini" 2>&1 | tee -a /tmp/polybar & disown
#polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
