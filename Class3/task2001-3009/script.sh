#!/bin/bash

for i in {0..9}; do
	touch "$i"
done

name=""

for i in $(ls); do
	name+="$i_"
done
 
echo $name > all_files.txt
cat all_files.txt

ls -R

rm -f {0..9} all_files.txt

ls -l
