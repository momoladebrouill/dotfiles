#!/usr/bin/env bash

# Set your subnet base (e.g., 192.168.1)
SUBNET="192.168.1"
START=1
END=254
TIMEOUT=1  # Timeout in seconds

echo "Scanning subnet: $SUBNET.0/24"
for i in $(seq $START $END); do
    (
        IP="$SUBNET.$i"
        if ping -c 1 -W $TIMEOUT $IP &> /dev/null; then
            HOSTNAME=$(getent hosts "$IP" | awk '{print $2}')
            if [ -z "$HOSTNAME" ]; then
                HOSTNAME=$(nslookup "$IP" 2>/dev/null | awk -F'= ' '/name =/ {print $2}' | sed 's/\.$//')
            fi
            echo "Host alive: $IP    Hostname: ${HOSTNAME:-Unknown}"
        fi
    ) &
done

wait

