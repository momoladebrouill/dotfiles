#!/usr/bin/bash

# Too deal with internet connection over nmcli 
function wifi_connect(){
	if [[ -z $1 ]]; then
		sudo nmcli dev wifi connect Darlyrayou
	else
		sudo nmcli dev wifi connect $1 -a
	fi
}

function wifi() {
	if [[ $1 == "l" ]]; then
		nmcli dev wifi list
	elif [[ $1 == "c" ]]; then
		wifi_connect $2
	elif [[ $1 == "lc" ]]; then
		nmcli dev wifi list
        if $($(nmcli dev wifi list) | grep Darlyrayou); then
		    wifi_connect $2
        fi
	elif [[ $1 == "on" ]]; then
		nmcli radio wifi on
	elif [[ $1 == "off" ]]; then
		nmcli radio wifi off
	elif [[ $1 == "" ]]; then
		nmcli
	else
		echo "Wrong or incomplete command, follow syntax:

		wifi [l|c|on|off] [SSID=Darlyrayou]"
	fi
}

function parch (){
    ping archlinux.org
}
