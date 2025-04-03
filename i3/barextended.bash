#!/usr/bin/env bash

i3status | while :
do
    read line
    power=$(/home/rayou/shscripts/power.bash)
    light=$(brightnessctl -m | cut -d ',' -f4)
    if [[ $line == ,[{* ]]; then
        echo "${line::-1},{\"full_text\":\"☸ $power\"},{\"full_text\":\"☀ $light\"}]"
    else
        echo "${line}"
    fi
done
