#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi
filename="$1"
if [ ! -f "$filename" ]; then
  echo "Error: File '$filename' not found."
  exit 1
fi
temp_file=$(mktemp)
while IFS= read -r line; do
  line_length="${#line}"
  midpoint=$((line_length / 2))
  first_half="${line:0:$midpoint}"
  second_half="${line:$midpoint}"
  echo "$second_half$first_half" >> "$temp_file"
done < "$filename"
mv "$temp_file" "$filename"
echo "Successfully swapped the first and second halves of each line in '$filename'."
exit 0
