#!/bin/bash

input_string=$(cat)
fib_numbers=(${input_string//:/ })
count=${#fib_numbers[@]}

if [ "$count" -lt 1 ]; then
  echo "Error: Input string must contain at least one number."
  exit 1
fi

for num in "${fib_numbers[@]}"; do
  if ! [[ "$num" =~ ^[0-9]+$ ]]; then
    echo "Error: All elements in the input string must be numbers. Found: '$num'"
    exit 1
  fi
done

if [ "$count" -lt 2 ]; then
  next_fib="$last"
else
  last=${fib_numbers[$((count - 1))]};
  second_last=${fib_numbers[$((count - 2))]};
  next_fib=$((last + second_last))
fi

result="${input_string}:${next_fib}"
echo "$result"
