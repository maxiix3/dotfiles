#!/bin/sh
while true; do
    feh --bg-scale "$(find ~/Pictures/wallpapers -type f |sort -R |tail -1)" &
    sleep 15m
done

