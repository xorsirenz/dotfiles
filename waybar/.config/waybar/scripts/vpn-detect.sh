#!/bin/bash

if wg show interfaces | grep -q .; then
    echo '{"text":"󰌾","class":"connected","tooltip":"WireGuard: Connected"}'
else
    echo '{"text":"󰦞","class":"disconnected","tooltip":"WireGuard: Disconnected"}'
fi
