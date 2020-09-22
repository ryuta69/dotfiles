#!/usr/bin/env bash

DATE_TIME=$(date +"%Y-%m-%d %H:%M")
WIFI_SSID=$(networksetup -getairportnetwork en0 | awk -F": " '{print $2}')
BATTERY_LEVEL=$(pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d'%')
BATTERY_STATUS=$(pmset -g batt | grep "'.*'" | sed "s/'//g" | awk '{print $4}')

echo $(cat <<EOF
{
  "date_time": "$DATE_TIME",
  "wifi": {
    "ssid": "$WIFI_SSID"
  },
  "battery": {
    "level": "$BATTERY_LEVEL",
    "status": "$BATTERY_STATUS"
  }
}
EOF
)
