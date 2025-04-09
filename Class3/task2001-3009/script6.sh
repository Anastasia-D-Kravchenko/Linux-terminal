#!/bin/bash

read -p "Enter the directory name to delete: " directory_to_delete

if [ -z "$directory_to_delete" ]; then
  echo "NOK: Directory name cannot be empty."
  exit 1
fi

if [ -d "$directory_to_delete" ]; then
  if rm -rf "$directory_to_delete"; then
    echo "OK: Directory '$directory_to_delete' successfully deleted."
  else
    echo "NOK: Failed to delete directory '$directory_to_delete'."
  fi
else
  echo "NOK: Directory '$directory_to_delete' does not exist."
fi

exit 0
