#!/bin/bash

# Array to hold file types
declare -A file_types

# Function to detect file types
detect_file_types() {
    echo -e "\e[34mStarting file type detection...\e[0m"  # Blue text
    for file in $(ls -p | grep -v /); do
        if [ -f "$file" ]; then
            extension="${file##*.}"
            file_types["$file"]="$extension"
            echo -e "\e[34mDetected file: $file with extension: $extension\e[0m"  # Blue text
        fi
    done
    echo -e "\e[34mFinished file type detection.\e[0m"  # Blue text
}

