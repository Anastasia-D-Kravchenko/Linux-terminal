#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi
target_dir="$1"
if [ ! -d "$target_dir" ]; then
  echo "Error: '$target_dir' is not a valid directory."
  exit 1
fi
find "$target_dir" -maxdepth 1 -type f -executable -print0 | while IFS= read -r -d $'\0' file; do
  echo "Executing: $file"
  "$file"
done
echo "Finished executing all executable files in '$target_dir'."
exit 0
