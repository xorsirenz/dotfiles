#!/usr/bin/env bash

if [[ $(pgrep -a openvpn$) ]]; then
    echo " "
else
    echo ""
fi
