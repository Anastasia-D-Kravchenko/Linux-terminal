#!/bin/bash

hput() {
  local HASH="$1F$(echo "$2" | tr '-' 'T')"
  eval "$HASH"="$3"
}

hget() {
  local HASH="$1F$(echo "$2" | tr '-' 'T')"
  echo "${!HASH}"
}

find_interval() {
  local VALUE="$1"
  local IFS=','
  for ((i=1; i<=${#TO[@]}; i++)); do
    if  [[ "${FROM[i]}" -le "$VALUE" && "$VALUE" -le  "${TO[i]}" ]]; then
      echo "${FROM[i]}-${TO[i]}"
      return 0
    fi
  done
}

intervals_preprocessing() {
  local IFS=','
  local I=1
  for INT in $(echo "$INTERVALS"); do
    hput intervals "$INT" 0
    FROM[I]=$(echo "$INT" | cut -d'-' -f1)
    TO[I]=$(echo "$INT" | cut -d'-' -f2)
    let I++
  done
}

collect_histogram() {
  local IFS=$'\n'
  local dir="$1"

  if [ ! -d "$dir" ] || [ ! -r "$dir" ]; then
    echo "Error: Directory '$dir' does not exist or cannot be read."
    return 1
  fi

  while IFS= read -r -d $'\0' file; do
    if [ -f "$file" ]; then
      SIZE=$(stat -c%s "$file")
      INTERVAL=$(find_interval "$SIZE")
      if [ -n "$INTERVAL" ]; then
        VALUE=$(hget intervals "$INTERVAL")
        if [ -n "$VALUE" ]; then
          let VALUE++
          hput intervals "$INTERVAL" "$VALUE"
        fi
      fi
    fi
  done < <(find "$dir" -type f -print0)
}

print_histogram() {
  local directory="$1"
  printf "Histogram for directory: %s\n" "$directory"
  printf "| %16s | %16s |\n" "File size class" "Number of files"
  local IFS=','
  for INT in $(echo "$INTERVALS"); do
    printf "| %16s | %16d |\n" "$INT" "$(hget intervals "$INT" || echo 0)"
  done
}

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <directory> <size_classes>"
  echo "  <directory>: The directory to analyze."
  echo "  <size_classes>: Comma-separated list of size classes (e.g., 0-100,200-2000,3000-4000)."
  exit 1
fi

DIRECTORY="$1"
INTERVALS="$2"

FROM=()
TO=()
intervals_preprocessing

collect_histogram "$DIRECTORY"
if [ $? -eq 0 ]; then
  print_histogram "$DIRECTORY"
fi

exit 0

