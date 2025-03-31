#!/bin/bash 

if [ $1 -gt 10 ]
then
	echo "greater"
elif [ $1 -lt 10 ]
then
	echo "less"

else
	echo "equal"
fi
