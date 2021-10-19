#!/usr/bin/env sh

if xrandr | grep "HDMI-1 connected"
then
    xrandr --output HDMI-1 --primary
    xrandr --output eDP-1 --off
    xrandr --output HDMI-1 --auto
    feh --randomize --bg-fill --no-fehbg ~/wallpapers/*
fi
