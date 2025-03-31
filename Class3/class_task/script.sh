#!/bin/bash

if [ $# -ne 1 ]
then
	echo "gimmy path to file"
else
	sort "$1" | uniq > result1.txt 
	 cat result1.txt
fi
