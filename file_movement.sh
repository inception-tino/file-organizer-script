#!/bin/bash

# Function to move files to their respective directories
file_movement() {
    echo -e "\e[33mMoving files to respective directories...\e[0m"  # Yellow text

    # This assumes the directory creation script has a variable or function that provides the directories created
    declare -A file_type_directories
    file_type_directories=$(get_directories)  # Hypothetical function to get directories mapping

    for file in *; do
        if [ -f "$file" ]; then
            file_type=$(detect_file_type "$file")  # Hypothetical function to detect file type
            target_dir="${file_type_directories[$file_type]}"

            if [ -d "$target_dir" ]; then
                mv "$file" "$target_dir"
                log_generation "Moved $file to $target_dir"  # Log the file movement
            else
                echo -e "\e[31mTarget directory $target_dir does not exist. Skipping $file...\e[0m"  # Red text
                log_generation "Failed to move $file: Target directory $target_dir does not exist"
            fi
        fi
    done
}

