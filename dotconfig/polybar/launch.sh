#!/usr/bin/env bash

# Terminate already running bar instances
killall -9 polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Set variables
NETWORK_TYPE="wired" # or `wireless`

# Launch the bar
echo "---" | tee -a /tmp/mypolybar.log
for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m NETWORK_TYPE=$NETWORK_TYPE polybar main >> /tmp/mypolybar.log 2>&1 & disown
done
echo "Bar launched..."
