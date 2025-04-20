#!/bin/bash

update_package() {
  local file="$1"
  local new_package="$2"

  if ! sed -i "s/^\s*package\s*\(.*\);/package $new_package;/g" "$file"; then
    echo "Error: Failed to update package declaration in '$file'"
    return 1
  fi
  return 0
}

java_mv() {
  local source="$1"
  local dest="$2"

  if [ ! -f "$source" ]; then
    echo "Error: Source file '$source' does not exist."
    return 1
  fi

  source_filename=$(basename "$source")

  if [ -d "$dest" ]; then
    dest_file="$dest/$source_filename"
    if ! mv "$source" "$dest_file"; then
      echo "Error: Failed to move '$source' to '$dest_file'"
      return 1
    fi
    echo "Moved '$source' to '$dest_file'"

  elif [[ "$dest" == *.java ]]; then
      if ! mv "$source" "$dest"; then
        echo "Error: Failed to rename '$source' to '$dest'"
        return 1
      fi
      echo "Renamed '$source' to '$dest'"

  else
    local new_package="$dest"
    source_dir=$(dirname "$source")
    new_file_path="$source_dir/$source_filename"

    if ! update_package "$source" "$new_package"; then
      return 1
    fi

     if [ "$source_dir" != "$(echo "$new_package" | sed 's/\./\//g')" ]; then
        new_dir="$(echo "$new_package" | sed 's/\./\//g')"
        mkdir -p "$new_dir"
        if ! mv "$source" "$new_dir/$source_filename"; then
           echo "Error: Failed to move '$source' to '$new_dir/$source_filename'"
           return 1
        fi
        echo "Package name in $source changed to $new_package and file moved to $new_dir/$source_filename"
     else
        echo "Package name in '$source' changed to '$new_package'"
     fi
  fi
  return 0
}

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <source_file> <destination>"
  echo "  - Moves a Java file or renames its package."
  echo "  - If destination is a directory, the file is moved."
  echo "  - If destination ends with .java, the file is renamed."
  echo "  - Otherwise, the package name inside the Java file is changed."
  exit 1
fi

source_file="$1"
  destination="$2"

java_mv "$source_file" "$destination" || exit 1

