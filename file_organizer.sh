#!/bin/bash

# Define the log file with an absolute path
LOG_FILE="/home/ec2-user/file-organizer-script/logs/organizer.log"

# Log action function
log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

# File Type Detection and Directory Creation
detect_and_create_dirs() {
    echo "Starting file detection and directory creation..."  # Debug output
    for file in $(ls -p | grep -v /); do
        if [ -f "$file" ]; then
            extension="${file##*.}"
            mkdir -p "$extension"
            mv "$file" "$extension/"
            log_action "Moved $file to $extension/"
            echo "Moved $file to $extension/"
        else
            echo "No files found to process."  # Debug output
        fi
    done
    echo "Finished file detection and directory creation."  # Debug output
}

detect_and_create_dirs




