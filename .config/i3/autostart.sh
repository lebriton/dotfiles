#!/usr/bin/env bash

sleep 60 && xfdesktop --quit
xsetroot -solid "#333333"

blueman-applet &
compton &
flameshot &
nm-applet &
