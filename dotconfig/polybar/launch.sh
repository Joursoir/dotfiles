#!/usr/bin/env bash

# Terminate already running bar instances
killall -9 polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Set variables
NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

# Launch the bar
echo "---" | tee -a /tmp/mypolybar.log
for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m NETWORK_INTERFACE=$NETWORK_INTERFACE polybar main >> /tmp/mypolybar.log 2>&1 & disown
done
echo "Bar launched..."
