#!/bin/bash

if [ $# -ne 1 ]
then
	echo "gimmy the path"
	exit 1
else
	egrep "^a" $1 >> $2
fi	
