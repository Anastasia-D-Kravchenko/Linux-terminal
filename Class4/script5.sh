#!/bin/bash

for file in ~/*.log; do
    if [[ -f "$file" ]]; then
        lines=$(wc -l < "$file")
        if [[ $lines -gt 10 ]]; then
            tail -n 10 "$file" > "$file.tmp" && mv "$file.tmp" "$file"
            echo "Modified: $file (reduced to last 10 lines)"
        else
            echo "Skipped: $file (only $lines lines, too few to reduce)"
        fi
    fi
done

