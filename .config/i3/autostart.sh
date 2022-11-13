#!/usr/bin/env bash

blueman-applet &
cbatticon &
compton &
flameshot &
gpaste-client &
nm-applet &
tint2 &
xss-lock --transfer-sleep-lock -- $HOME/bin/my-lock &

~/workspace/bin/Nextcloud*.AppImage &

# -----------------------------------------------------------------------------
# specific to current machine

xrandr --output HDMI2 --auto --left-of eDP1 &
xinput set-prop "Logitech Gaming Mouse G502" "libinput Accel Speed" -.95 &
