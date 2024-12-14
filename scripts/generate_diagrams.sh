#!/bin/bash

PICTURES_DIR="$(pwd)/pictures"
DIAGRAMS_DIR="$(pwd)/diagrams"
CACHE_DIR="/tmp/plantuml_cache"

# Function to get all dependencies for a PUML file
get_dependencies() {
    local file="$1"
    # Find all !include statements and extract the included file paths
    grep -o '!include\s\+[^[:space:]]\+' "$file" | cut -d' ' -f2 | while read -r include; do
        # Convert relative path to absolute
        if [[ "$include" = /* ]]; then
            echo "$include"
        else
            echo "$(dirname "$file")/$include"
        fi
    done
}

# Function to calculate hash of file with all its dependencies
calculate_total_hash() {
    local file="$1"
    {
        # Hash of the main file
        sha256sum "$file"
        # Hash of all dependencies
        get_dependencies "$file" | while read -r dep; do
            if [ -f "$dep" ]; then
                sha256sum "$dep"
            fi
        done
    } | sha256sum | cut -d' ' -f1
}

# Convert all PlantUML files to PNG
for file in $(find "$DIAGRAMS_DIR" -name "*.puml" | sed "s|^$DIAGRAMS_DIR/||"); do
    output_file="${file%.puml}.png"
    output_dir="$PICTURES_DIR/$(dirname "$file")"
    output_path="$output_dir/$(basename "$output_file")"
    sha_file="$CACHE_DIR/${file%.puml}.sha256"

    mkdir -p "$output_dir"
    mkdir -p "$(dirname "$sha_file")"

    # Calculate hash including dependencies
    current_hash=$(calculate_total_hash "$DIAGRAMS_DIR/$file")
    
    # Check if hash file exists and matches, and output file exists
    if [ -f "$sha_file" ] && [ "$(cat "$sha_file")" = "$current_hash" ] && [ -f "$output_path" ]; then
        echo "Skipping $output_file (unchanged)..."
        continue
    fi

    echo "Generating $output_file..."
    # Generate to temp file first
    temp_dir=$(mktemp -d)
    plantuml "$DIAGRAMS_DIR/$file" -tpng -o "$temp_dir"
    
    # Get the generated file (may have @startuml name) and move to desired location
    generated_file=$(find "$temp_dir" -name "*.png")
    mv "$generated_file" "$output_path"
    rm -rf "$temp_dir"
    
    # Save new hash
    echo "$current_hash" > "$sha_file"
done

echo "Diagrams generated successfully in pictures directory!"
