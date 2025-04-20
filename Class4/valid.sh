#!/bin/bash

validate_java_class() {
  if [ ! -f "$1" ]; then
    echo "Error: File '$1' does not exist."
    return 1
  fi

  if [[ "$1" != *.java ]]; then
    echo "Error: File '$1' does not have a .java extension."
    return 1
  fi

  filename=$(basename "$1")
  class_name="${filename%.*}"

  package_line=$(grep -m 1 "^package " "$1")
  public_class_line=$(grep -m 1 "^public class " "$1")

  if [ -z "$package_line" ]; then
    echo "Error: File '$1' does not contain a package declaration."
    return 1
  fi

  if [ -z "$public_class_line" ]; then
    echo "Error: File '$1' does not contain a public class definition."
    return 1
  fi

  declared_package=$(echo "$package_line" | awk '{print $2}' | tr -d ';')
  declared_class=$(echo "$public_class_lP0+r\P0+r\P0+r\P0+r\P0+r\P0+r\P0+r\ine" | awk '{print $3}' | tr -d ' {')

  expected_dir=$(echo "$declared_package" | sed 's/\./\//g')
  actual_dir=$(dirname "$1")

  if [ "$actual_dir" != "$expected_dir" ]; then
    echo "Error: File '$1' is not in the correct directory. Expected '$expected_dir', but found '$actual_dir'"
    return 1
  fi

  if [ "$declared_class" != "$class_name" ]; then
    echo "Error: Declared class name '$declared_class' does not match the filename '$class_name' in '$1'."
    return 1
  fi

  echo "File '$1' is a valid Java class."
  return 0
}

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <file1> <file2> ..."
  echo "  Checks if the given files are valid Java class files."
  exit 1
fi

for file in "$@"; do
  validate_java_class "$file" || error=1
done

if [ -n "$error" ]; then
  exit 1
fi

