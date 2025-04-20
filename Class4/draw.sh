#!/bin/bash

draw_envelope() {
  local size="$1"

  if ! [[ "$size" =~ ^[0-9]+$ ]] || [ "$size" -le 0 ]; then
    echo "Error: Size must be a positive integer."
    return 1
  fi

  local middle=$((size / 2))

  for (( row=0; row<size; row++ )); do
    for (( col=0; col<size; col++ )); do
      if [ "$row" -eq 0 ] || [ "$row" -eq $((size - 1)) ] || \
         [ "$col" -eq 0 ] || [ "$col" -eq $((size - 1)) ] || \
         [ "$row" -eq "$col" ] || [ "$row" -eq $((size - 1 - col)) ]; then
        printf "*"
      else
        printf " "
      fi
    done
    printf "\n"
  done
}

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <size>"
  echo "  <size>: A positive integer representing the size of the envelope."
  exit 1
fi

size="$1"

draw_envelope "$size"

