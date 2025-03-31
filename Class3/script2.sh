#!/bin/bash

if [ -f $1 ]
then
	echo "file"
elif [ -d $1]
then
	echo "directory"
elif [ -e $1 ]
then
	echo "exists"
fi
