#!/bin/bash

fibonacci() {
  local n="$1"
  local a=0
  local b=1
  local temp

  if [ "$n" -le 0 ]; then
    echo 0
    return
  fi

  for (( i=1; i<n; i++ )); do
    temp=$b
    b=$((a + b))
    a=$temp
  done
  echo $b
}

create_fibonacci_dirs() {
  local depth="$1"
  local current_dir="."
  local dir_count
  local new_dir

  if [ "$depth" -gt 10 ]; then
    echo "Error: Depth cannot be greater than 10."
    exit 1
  fi

  if [ "$depth" -lt 0 ]; then
    echo "Error: Depth must be a non-negative integer."
    exit 1
  fi

  for (( i=1; i<=depth; i++ )); do
    dir_count=$(fibonacci "$i")
    for (( j=1; j<=dir_count; j++ )); do
      new_dir="$current_dir/dir$i-$j"
      mkdir -p "$new_dir"
      if [ ! -d "$new_dir" ]; then
        echo "Error: Failed to create directory '$new_dir'"
        exit 1
      fi
    done
    current_dir="$new_dir"
  done
}

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <depth>"
  echo "  <depth>: A non-negative integer (<=10) representing the depth of the directory structure."
  exit 1
fi

depth="$1"

if ! [[ "$depth" =~ ^[0-9]+$ ]]; then
  echo "Error: Depth must be a non-negative integer."
  exit 1
fi

create_fibonacci_dirs "$depth"

