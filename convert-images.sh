#!/bin/bash
# Converts HEIC and TIFF images to JPEG in the books content directory.
# Uses macOS built-in `sips` — no extra dependencies needed.

CONTENT_DIR="/Users/xavier/Library/Mobile Documents/com~apple~CloudDocs/natasha/content"

find "$CONTENT_DIR/books" "$CONTENT_DIR/knitting" -type f \( -iname "*.heic" -o -iname "*.tiff" -o -iname "*.tif" \) | while read -r file; do
    dir=$(dirname "$file")
    base=$(basename "$file")
    name="${base%.*}"
    output="$dir/$name.JPEG"

    if [ -f "$output" ]; then
        echo "Skipping $base (already converted)"
        continue
    fi

    echo "Converting $base -> $name.JPEG"
    sips -s format jpeg "$file" --out "$output"
    rm "$file"
done
