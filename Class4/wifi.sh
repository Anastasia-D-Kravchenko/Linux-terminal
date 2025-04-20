#!/bin/bash

hput() {
  HASH="$1F$(echo $2 | tr '-' 'T')"
  eval "$HASH"="$3"
}

hget() {
  HASH="$1F$(echo $2 | tr '-' 'T')"
  echo ${!HASH}
}

hashmap_initialization() {
  IFS=','
  I=1
  for NET in $(echo "$WIFI"); do
    hput nets "$NET" "$1"
    let I++
  done
}

read_data_from_wifi_sensors_fake() {
  IFS=','
  for NET in $(echo "$WIFI"); do
    PREV_STRANGTH=$(hget nets "$NET")
    DATA_FROM_SENSOR="$RANDOM"
    let CHANGE_STRANGTH=DATA_FROM_SENSOR%%20-10
    let CURRENT_STRENGTH=PREV_STRANGTH+CHANGE_STRANGTH
    if [ "$CURRENT_STRENGTH" -gt 80 ]; then
      CURRENT_STRENGTH=80
    elif [ "$CURRENT_STRENGTH" -lt 0 ]; then
      CURRENT_STRENGTH=0
    fi
    hput nets "$NET" "$CURRENT_STRENGTH"
  done
}

print_wifi_strength() {
  IFS=','
  for NET in $(echo "$WIFI"); do
    printf "%%s %%d\n"  "$NET" $(hget intervals "$NET")
  done
}

lock() {
  while [ -e /tmp/current_wifi_data ]; do
    sleep 0.1
  done;
}

unlock() {
  cat /tmp/wifi_tmp$$
  cat /tmp/wifi_tmp$$ > /tmp/current_wifi_data
}

WIFI="WiFi-room1,WiFi-room2,Wifi-room3,Wifi-room4,Wifi-Orange,Wifi-speed,Wifi-Castle"

hashmap_initialization 5

while true; do
  read_data_from_wifi_sensors_fake
  lock
  print_wifi_strength > /tmp/wifi_tmp$$
  unlock
  sleep 0.1
done

exit 0
