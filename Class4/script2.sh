#!/bin/bash

for file in *.txt; do
if [ -f "$file" ]; then
lines=$(wc -l < "$file")
if [ $lines -gt 10 ]; then
rm "$file"
echo "Deleted: $file (had $lines lines)"
fi
fi
done
