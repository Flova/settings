#!/usr/bin/env sh

#take Screenshot
scrot /tmp/screen_locked.png

#Edit it
convert /tmp/screen_locked.png -fill black -colorize 40%  /tmp/screen_locked.png

#launch i3lock
i3lock -i /tmp/screen_locked.png
