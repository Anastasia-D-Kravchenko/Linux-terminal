#!/bin/bash
input_string=$(cat)
fib_numbers=(${input_string//:/ })
count=${#fib_numbers[@]}
last=${fib_numbers[$((count - 1))]};
second_last=${fib_numbers[$((count - 2))]};
next_fib=$((last + second_last))
result="${input_string}:${next_fib}"
echo "$result"

