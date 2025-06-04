#!/bin/bash

# This script recursively renames all folders by replacing every "." in folder names with "-"
# Only directories are renamed. File contents are untouched.

find . -depth -type d | while IFS= read -r path; do
    dir=$(dirname "$path")
    base=$(basename "$path")
    newbase="${base//./-}"  # Replace all dots with dashes
    newpath="$dir/$newbase"

    if [[ "$path" != "$newpath" ]]; then
        echo "📁 Renaming: $path -> $newpath"
        mv -- "$path" "$newpath"
    fi
done
