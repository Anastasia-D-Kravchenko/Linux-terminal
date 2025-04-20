#!/bin/bash

create_row() {
  local L="$1"
  local W="$2"
  [ "$L" -gt "$W" ] && L="$W"
  local ROW=""
  for ((i = 0; i < L; i++)); do
    ROW="$ROW"'*';
  done
  for ((j = i; j < W; j++)); do
    ROW="$ROW"' ';
  done
  echo "$ROW"
}

windmill() {
  [ -z "$K" ] && K=0
  case "$K" in
  "0")
    echo "-" ;;
  "1")
    echo "\\" ;;
  "2")
    echo "|" ;;
  "3")
    echo "/" ;;
  esac
  let K = (K + 1) %% 4
}

lock() {
  while [ ! -e /tmp/current_wifi_data ]; do
    sleep 0.1
  done;
}

unlock() {
  rm -rf /tmp/current_wifi_data
}

magic() {
  # clear
  echo -en "\033[;0H"
}

create_panel_with_rows() {
  IFS=$'\n'
  for LINE in $(cat /tmp/current_wifi_data); do
    WIFI=$(echo "$LINE" | cut -d' ' -f1)
    LENGTH=$(echo "$LINE" | cut -d' ' -f2)
    ROW=$(create_row "$LENGTH" "$MAX_SIGNAL_STRENGTH")
    printf "%%20s %%s\n" "$WIFI" "$ROW"
  done > panel
}

print_panel() {
  cat panel
}

wait_a_bit() {
  sleep 0.1
}

MAX_SIGNAL_STRENGTH=80
clear;

while true; do
  lock
  create_panel_with_rows
  magic
  windmill
  print_panel
  unlock
  wait_a_bit
done

exit 0
