#!/bin/bash

source ./mv.sh

if [ ! -f "./mv.sh" ]; then
  echo "Error: The script 'mv.sh' was not found in the current directory."
  exit 1
fi

explain_error() {
  local error_code="$1"
  local source_file="$2"
  local destination="$3"

  case "$error_code" in
    1)
      if [ ! -f "$source_file" ]; then
        echo "Error: Source file '$source_file' does not exist."
      elif [ -z "$source_file" ] || [ -z "$destination" ]; then
        echo "Usage: $0 <source_file> <destination>"
        echo "  - Moves a Java file or renames its package."
        echo "  - If destination is a directory, the file is moved."
        echo "  - If destination ends with .java, the file is renamed."
        echo "  - Otherwise, the package name inside the Java file is changed."
      else
        echo "Error: An unspecified error occurred while processing '$source_file'."
      fi
      ;;
    2)
      echo "Error: Failed to update the package declaration in '$source_file'."
      ;;
    3)
      echo "Error: Failed to move '$source_file' to '$destination'."
      ;;
    4)
      echo "Error: Failed to rename '$source_file' to '$destination'."
      ;;
    *)
      echo "Error: Unknown error code: $error_code"
      ;;
  esac
}

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <source_file> <destination>"
  exit 1
fi

source_file="$1"
destination="$2"

java_mv "$source_file" "$destination"
error_code=$?

if [ "$error_code" -ne 0 ]; then
  explain_error "$error_code" "$source_file" "$destination"
  exit 1
fi

echo "Operation completed successfully."

