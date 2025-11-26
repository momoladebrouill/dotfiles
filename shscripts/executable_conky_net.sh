#!/usr/bin/env bash

# Get list of interfaces that are UP (excluding loopback)

IFACE="tun0"
if ip a show $IFACE > /dev/null 2>&1; then
    if ip a show $IFACE | grep -q "inet "; then
         IP=$(ip -4 addr show $IFACE | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n1)
        echo "$alignr VPN's ip $IP"
    fi
fi


