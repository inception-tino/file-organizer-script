#!/bin/bash

# Source other scripts
source "$(dirname "$0")/log_generation.sh"
source "$(dirname "$0")/file_movement.sh"

# Function to get user input
get_user_input() {
    read -p "Enter the directory to organize: " target_directory
    if [ -d "$target_directory" ]; then
        cd "$target_directory" || exit
        echo -e "\e[36mOrganizing directory: $target_directory\e[0m"  # Cyan text
    else
        echo -e "\e[31mDirectory does not exist. Exiting...\e[0m"  # Red text
        exit 1
    fi
}

# Main function to integrate all modules
main() {
    get_user_input
    detect_file_types
    create_directories
    file_movement  # Move files to their respective directories
    generate_log  # Log the actions performed
    echo -e "\e[35mOrganization complete!\e[0m"  # Magenta text
}

# Run the main function
main

