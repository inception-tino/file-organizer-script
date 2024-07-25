#!/bin/bash

# Function to log actions
log_generation() {
    local log_message=$1
    local log_file="organization_log.txt"

    echo "$(date +'%Y-%m-%d %H:%M:%S') - $log_message" >> "$log_file"
}

