#!/bin/bash

result=$1
i=0
while [ $i -lt $2 ]
do
	((i++))
	let result=$result/2
done
echo $result 
