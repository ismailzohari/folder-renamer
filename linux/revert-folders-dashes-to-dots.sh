#!/bin/bash

# This script reverses the renaming: it replaces all "-" in folder names with "."
# Only directories are affected. File contents remain untouched.

find . -depth -type d | while IFS= read -r path; do
    dir=$(dirname "$path")
    base=$(basename "$path")
    newbase="${base//-/.}"  # Replace all dashes with dots
    newpath="$dir/$newbase"

    if [[ "$path" != "$newpath" ]]; then
        echo "↩️ Reverting: $path -> $newpath"
        mv -- "$path" "$newpath"
    fi
done
