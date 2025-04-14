#!/bin/bash

lines=$(egrep "^c" $1)
biggest=0
while read -r i;do
chars=$(echo $i " wc -m)
if [ $chars -ge $biggest ];then
iggest=$chars
line=$i
fi
done <<< "$lines"
echo $line
echo $line >> $2
