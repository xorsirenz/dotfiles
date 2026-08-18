#!/usr/bin/env bash

updates=$(dnf -q check-update 2>/dev/null | awk '
  /^[[:alnum:]][^[:space:]]*[[:space:]]/ {
    count++
  }
  END {
    print count+0
  }
')

if [ "$updates" -gt 0 ]; then
    printf '{"text":"%s ","tooltip":"%s package(s) available for update","class":"updates"}\n' "$updates" "$updates"
else
    printf '{"text":"","tooltip":"System is up to date","class":"updated"}\n'
fi
