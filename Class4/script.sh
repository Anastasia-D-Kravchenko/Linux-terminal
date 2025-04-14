#!/bin/bash

declare -A sounds
sounds["cat"]="meo meo"
sounds["dog"]="woof woof"
sounds["cow"]="moo moo"

for i in $@; do
if [[ -n "${sounds[$i]}" ]]; then
	echo "For $i goes sound: ${sounds[$i]}"
else
	echo "We currently can support only: ${sounds[@]}"
fi
done
