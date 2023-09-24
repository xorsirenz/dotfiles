#!/usr/bin/env bash

function vpnstatus() {
if [[ $(pgrep -a openvpn$) ]]; then
    NAME=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF}')
        echo " "
else
    echo " "
fi
}

vpnstatus
