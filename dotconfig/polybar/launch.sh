#!/usr/bin/env bash

# Terminate already running bar instances
killall -9 polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
echo "---" | tee -a /tmp/mypolybar.log
polybar main >> /tmp/mypolybar.log 2>&1 & disown
echo "Bar launched..."
