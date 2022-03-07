#!/usr/bin/env bash

# Settings for Keychron K3 v2
#
# Settings for Keychron keyboards: https://github.com/kurgol/keychron
# Some shortcuts: https://blog.colinwaddell.com/keychron-function-keys-configuration/
#
# NOTE: Keychron keyboards use the hid_apple driver.

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Function keys:
#
# fnmode:
# 0 = fn key disabled
# 1 = fn key pressed by default
# 2 = fn key released by default

echo "options hid_apple fnmode=2" >> /etc/modprobe.d/hid_apple.conf
echo "Reboot your system or notify hid_apple to reload its configuration"
