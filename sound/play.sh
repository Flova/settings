#!/bin/bash
status1=$(playerctl status)
if [ $status1 == "Playing" ]
then
    playerctl pause
else
    playerctl play
fi

