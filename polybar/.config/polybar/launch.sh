#!/usr/bin/sh

BAR_NAME=workspace
BAR_NAME1=time
BAR_NAME2=settings

IFS=$'\n'

for item in $(polybar --list-monitors); do
    MONITOR=$(echo $item | cut -d" " -f1 | cut -d":" -f1)
    IS_PRIMARY=$(echo $item | cut -d" " -f3)
    if [[ $IS_PRIMARY == *"primary"* ]]; then
        TRAY_POSITION=right MONITOR=$MONITOR polybar --reload $BAR_NAME & polybar --reload $BAR_NAME1 & polybar --reload $BAR_NAME2
    else
        MONITOR=$MONITOR polybar --reload $BAR_NAME &
    fi
done
