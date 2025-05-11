#!/usr/bin/env bash
if pgrep -x "conky" > /dev/null
then
    pkill conky
else
    conky &
fi

