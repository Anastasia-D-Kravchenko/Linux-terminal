#!/bin/bash

for i in *.tt
do
	egrep '^c.{1}' $i
done
