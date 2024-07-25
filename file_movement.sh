#!/bin/bash

# Function to move files to their respective directories and log actions
file_movement() {
    log_file="file_movement.log"
    echo "File movement started at $(date)" > "$log_file"
    for file in *; do
        if [ -f "$file" ]; then
            # Determine the file type
            file_type=$(file --mime-type -b "$file" | cut -d'/' -f1)
            # Create the directory if it does not exist
            [ ! -d "$file_type" ] && mkdir -p "$file_type"
            # Move the file to the respective directory
            mv "$file" "$file_type/"
            # Log the action
            echo "Moved $file to $file_type/ at $(date)" >> "$log_file"
        fi
    done
    echo "File movement completed at $(date)" >> "$log_file"
}

