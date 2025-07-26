#!/usr/bin/env bash

# Get list of interfaces that are UP (excluding loopback)
down=""
for iface in $(ls /sys/class/net | grep -vE "lo$"); do
    state=$(cat /sys/class/net/$iface/operstate 2>/dev/null)
    if [[ "$state" == "up" ]]; then
        down=$(cat /sys/class/net/$iface/statistics/rx_bytes)
        up=$(cat /sys/class/net/$iface/statistics/tx_bytes)
        down_speed=$(cat /sys/class/net/$iface/statistics/rx_bytes)
        up_speed=$(cat /sys/class/net/$iface/statistics/tx_bytes)
        pretty_down=$(numfmt --to=iec --suffix=B --padding=7 $down)
        printf "\${color1}$iface\$color\n"
        printf "\$alignr\${downspeed $iface} down\n"
        printf "\$alignr\${upspeed $iface} up\n"
    fi
done

IFACE="tun0"
if ip a show $IFACE > /dev/null 2>&1; then
    if ip a show $IFACE | grep -q "inet "; then
         IP=$(ip -4 addr show $IFACE | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n1)
        echo "\${color1}$IFACE\$color"
        echo "  ip $IP"
    fi
fi



if [[ -z $down ]]; then
    printf "\$alignc Offline :)"
fi  

