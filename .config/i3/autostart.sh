#!/usr/bin/env bash

exec --no-startup-id blueman-applet
exec --no-startup-id cbatticon
exec --no-startup-id compton
exec --no-startup-id flameshot
exec --no-startup-id nm-applet
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# -----------------------------------------------------------------------------
# specific to current machine

exec --no-startup-id xrandr --output HDMI2 --auto --left-of eDP1
exec --no-startup-id xinput set-prop "Logitech Gaming Mouse G502" "libinput Accel Speed" -.95
