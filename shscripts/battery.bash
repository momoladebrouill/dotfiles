#!/usr/bin/env bash

function battery(){
	grep POWER_SUPPLY_CAPACITY= /sys/class/power_supply/BAT0/uevent | sed "s/.*=//"
}
