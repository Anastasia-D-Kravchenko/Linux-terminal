#!/bin/bash

#Using echo
echo "1970-01-01\n"

# Using printf
printf "1970-01-01\n"

# Using cat with a here string
cat <<< "1970-01-01"

# Variable assignment and printf
DATE="1970-01-01"
printf "%s\n" "$DATE"

# Variable assignment and declare -p
DATE="1970-01-01"
declare -p DATE | cut -d'"' -f2
