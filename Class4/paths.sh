#!/bin/bash
paths=(${PATH//:/ })
num_paths=${#paths[@]}
echo "There are $num_paths paths in your PATH environment variable."
