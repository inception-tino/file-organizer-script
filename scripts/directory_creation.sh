#!/bin/bash

# Function to create directories based on file types
create_directories() {
    echo -e "\e[32mStarting directory creation...\e[0m"  # Green text
    for extension in "${file_types[@]}"; do
        if [ ! -d "$extension" ]; then
            mkdir -p "$extension"
            echo -e "\e[32mCreated directory: $extension\e[0m"  # Green text
        else
            echo -e "\e[32mDirectory already exists: $extension\e[0m"  # Green text
        fi
    done
    echo -e "\e[32mFinished directory creation.\e[0m"  # Green text
}

