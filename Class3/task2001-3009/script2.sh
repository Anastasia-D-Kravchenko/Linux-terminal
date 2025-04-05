#!/bin/bash

for ext in "txt" "sh"; do
  echo "--- Files with .$ext extension in current directory: ---"
  find ./ -type f -name "*.${ext}" -print0 | while IFS= read -r -d $'\0' file; do
    echo "Counting lines in: \"$file\""
    wc -l "$file"
  done
  echo ""
done
