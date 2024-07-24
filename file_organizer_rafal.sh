#!/bin/bash

# Define the log file with an absolute path
LOG_FILE="/home/ec2-user/file-organizer-script/logs/organizer.log"

# Ensure the log directory exists
mkdir -p "$(dirname "$LOG_FILE")"

# Log action function
log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

# File Type Detection and Directory Creation
detect_and_create_dirs() {
    echo "Starting file detection and directory creation..."  # Debug output
    log_action "Starting file detection and directory creation..."

    for file in $(ls -p | grep -v /); do
        if [ -f "$file" ]; then
            extension="${file##*.}"
            mkdir -p "$extension"
            mv "$file" "$extension/"
            log_action "Moved $file to $extension/"
            echo "Moved $file to $extension/"
        else
            echo "$file is not a regular file."  # Debug output for non-regular files
        fi
    done

    echo "Finished file detection and directory creation."  # Debug output
    log_action "Finished file detection and directory creation."
}

detect_and_create_dirs

