#!/bin/bash

# Function to create directories based on file types
create_directories() {
    echo -e "\e[32mStarting directory creation...\e[0m"  # Green text
    for extension in "${file_types[@]}"; do
        mkdir -p "$extension"
    done
    echo -e "\e[32mFinished directory creation.\e[0m"  # Green text
}

