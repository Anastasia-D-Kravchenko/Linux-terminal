#!/bin/bash

if [ $# -ne 1 ]
then
	echo "gimmy the path"
else
	find ~ -name "$1"
fi	
