#!/bin/bash
# This script safely renames folders that end with a trailing dot (.)
# Linux allows trailing dots in folder names, but this script removes them for consistency.
# It traverses directories recursively, from deepest to shallowest.

# Find all directories ending with a dot, sort by path length descending (deepest first)
find . -depth -type d -name '*.' | while IFS= read -r dir; do
    base=$(basename "$dir")
    parent=$(dirname "$dir")

    # Remove trailing dot(s)
    newname="${base%\.}"
    newpath="$parent/$newname"

    if [ -e "$dir" ]; then
        echo "🛠️ Fixing trailing dot: $dir -> $newpath"
        mv -- "$dir" "$newpath"
    else
        echo "⛔ Folder not accessible: $dir"
    fi
done
