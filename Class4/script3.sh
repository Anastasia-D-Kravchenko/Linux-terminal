#!/bin/bash

if [ ! -d "$1" ]; then
echo "Error: No such a dirrectory"
exit 1
fi

find ./ -type f -name 't*.txt' -exec mv {} "$1" 2>>error.txt
echo "Done"
