#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <package_name> <class_name>"
  exit 1
fi

package_name="$1"
class_name="$2"

package_dir=$(echo "$package_name" | sed 's/\./\//g')

mkdir -p "$package_dir"

if [ ! -d "$package_dir" ]; then
  echo "Error: Failed to create directory structure '$package_dir'"
  exit 1
fi

file_path="$package_dir/$class_name.java"
cat > "$file_path" <<EOL
package $package_name;

public class $class_name {
    public static void main(String[] args) {
        System.out.println("Hello world");
    }
}
EOL

if [ ! -f "$file_path" ]; then
  echo "Error: Failed to create Java file '$file_path'"
  exit 1
fi

echo "Java class '$class_name' created successfully at '$file_path'"

