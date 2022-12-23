#!/usr/bin/env bash

sleep 60 && xfdesktop --quit
#xsetroot -solid "#333333"
feh --bg-fill $HOME/.config/i3/leaves3.jpg

blueman-applet &
compton &
flameshot &
nm-applet &
