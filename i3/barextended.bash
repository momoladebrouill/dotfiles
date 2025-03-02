#!/usr/bin/env bash

i3status | while :
do
    read line
    power=$(/home/rayou/shscripts/power.bash)
    if [[ $line == ,[{* ]]; then
        echo "${line::-1},{\"full_text\":\"☸ $power\"}]"
    else
        echo "${line}"
    fi
done
