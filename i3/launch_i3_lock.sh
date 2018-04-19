#!/usr/bin/env sh

#take Screenshot
scrot /tmp/screen_locked.png

#Edit it
#convert /tmp/screen_locked.png -fill black -colorize 40%  /tmp/screen_locked.png #Darken image

#Edit it
#convert /tmp/screen_locked.png -blur 3x3  /tmp/screen_locked.png #Blur Image

convert /tmp/screen_locked.png -filter Gaussian -resize 25% -define filter:sigma=1 -resize 400% /tmp/screen_locked.png

#launch i3lock
i3lock -i /tmp/screen_locked.png -o '#191d0f' -w '#b22727' -l '#636262'
