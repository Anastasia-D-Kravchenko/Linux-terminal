#!/bin/bash

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <package_name> <class_name> [options]"
  echo "Options:"
  echo "  -m    Include main function"
  echo "  -h    Include 'Hello world' output in main function (requires -m)"
  exit 1
fi

package_name="$1"
class_name="$2"

include_main=false
include_hello=false

shift 2
while [ "$#" -gt 0 ]; do
  case "$1" in
    -m) include_main=true ;;
    -h) include_hello=true ;;
    *)
      echo "Error: Invalid option '$1'"
      exit 1
      ;;
  esac
  shift
done

package_dir=$(echo "$package_name" | sed 's/\./\//g')

mkdir -p "$package_dir"

if [ ! -d "$package_dir" ]; then
  echo "Error: Failed to create directory structure '$package_dir'"
  exit 1
fi

file_path="$package_dir/$class_name.java"

class_content="package $package_name;
public class $class_name {
"

if $include_main; then
  class_content="${class_content}
    public static void main(String[] args) {
"
  if $include_hello; then
    class_content="${class_content}
        System.out.println(\"Hello world\");
"
  fi
  class_content="${class_content}
    }
"
fi

class_content="${class_content}
}
"

echo "$class_content" > "$file_path"

if [ ! -f "$file_path" ]; then
  echo "Error: Failed to create Java file '$file_path'"
  exit 1
fi

echo "Java class '$class_name' created successfully at '$file_path'"

