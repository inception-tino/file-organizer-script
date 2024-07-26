#!/bin/bash

# Function to finalize the log
generate_log() {
    log_file="file_movement.log"
    final_log="final_log.txt"

    # Check if the log file exists
    if [ ! -f "$log_file" ]; then
        echo "Error: Log file $log_file does not exist."
        return 1
    fi

    {
        echo "Final Log generated at $(date)"
        echo "----------------------------------"
        echo ""
        echo "Summary of File Movements:"
        echo ""
        echo "Files moved to categories:"
        grep 'Moved' "$log_file" | cut -d' ' -f3 | sort | uniq -c
        echo ""
        echo "Detailed Log:"
        echo "----------------------------------"
        cat "$log_file"
    } > "$final_log"

    if [ $? -eq 0 ]; then
        echo "Log generated successfully at $(date)" >> "$final_log"
        echo -e "\e[32mLog file has been successfully created and stored as $final_log\e[0m"  # Green text
    else
        echo -e "\e[31mFailed to generate the log file.\e[0m"  # Red text
        return 1
    fi
}

