#!/usr/bin/bash

source ./process_monitor.conf  # Load configuration file

process_monitor() {  # Main function for process monitoring
    while true; do
        echo "--------------------------------------------------------"
        echo "Real-Time Process Monitoring (Updated Every $UPDATE_INTERVAL sec)"

        echo "Enter the Operation:"
        echo "1. Process Information"
        echo "2. Kill a Process"
        echo "3. Process Statistics"
        echo "4. Search and Filter"
        echo "5. Resource Usage Alerts"
        read -r operation

        case "$operation" in
            1)
                process_information  # Display process information
                ;;
            2)
                process_kill  # Kill a process
                ;;
            3)
                process_statistics  # Show system process statistics
                ;;
            4)
                process_search_filter  # Search and filter processes
                ;;
            5)
                process_usage_alert  # Monitor resource usage and trigger alerts
                ;;
            *)
                echo "Invalid Operation"  # Invalid operation
                ;;
        esac
        echo "--------------------------------------------------------"
        
        sleep "$UPDATE_INTERVAL"  # Sleep for the specified interval
    done
}

process_information() {
    # Use ps to list process in detailed information
    ps aux
}

process_statistics() {
    echo "----------------------------"
    echo "System Process Statistics"
    echo "----------------------------"

    # Total number of processes
    total_processes=$(ps -e | wc -l)
    echo "Total Processes: $total_processes"

    # CPU load (load averages for 1, 5, and 15 minutes)
    # Split each line of input into fields using 'load average:' as the delimiter.
    # and prints the second field of the input line.
    cpu_load=$(uptime | awk -F'load average:' '{print $2}')
    echo "CPU Load Averages (1, 5, 15 min): $cpu_load"

    # Memory usage
    mem_usage=$(free -h | awk '/^Mem:/ {printf "Used: %s / Total: %s", $3, $2}')
    echo "Memory Usage: $mem_usage"

    # Number of processes per user
    echo -e "\nProcesses by User:"
    ps -eo user= | sort | uniq -c | sort -nr
}

process_kill() {
    echo "Enter the PID of the process you want to kill (or press Enter to skip):"
    read -r kill_pid  # Capture the user input

    # Check if the user entered a PID
    if [[ -n "$kill_pid" ]]; then
        # Kill the process
        kill "$kill_pid"

        # Check if the process was successfully killed
        if [[ $? -eq 0 ]]; then
            echo -e "Process with PID $kill_pid has been terminated. \n\n"
        else
            echo -e "Failed to kill process with PID $kill_pid \n\n"
        fi
    else
        echo -e "No PID entered. Exiting without killing any process. \n\n"
    fi
}

process_search_filter() {
    # Search for processes based on criteria such as name, user, or resource usage
    echo "Enter the Criteria:"
    echo "1. Search by PID"
    echo "2. Search by User Name"
    echo "3. Search by CPU Usage"
    echo "4. Search by MEM Usage"
    read -r choice

    case "$choice" in
        1)
            echo "Enter Process PID"
            read -r pid_criteria
            echo "   PID  %CPU  %MEM  USER  COMM"
            ps -eo pid,%cpu,%mem,user,comm | grep -i "$pid_criteria"
            ;;
        2)
            echo "Enter Process User Name"
            read -r user_criteria
            echo "   PID  %CPU  %MEM  USER  COMM"
            ps -eo pid,%cpu,%mem,user,comm | grep  -i "$user_criteria"
            ;;
        3)
            echo "Enter Process CPU Resource"
            read -r cpu_criteria
            echo "Searching for processes with CPU usage greater than $cpu_criteria%..."
            echo "   PID  %CPU  %MEM  USER  COMM"
            ps -eo pid,%cpu,%mem,comm | awk -v cpu="$cpu_criteria" '$2 > cpu {print $0}'
            ;;
        4)
            echo "Enter Process Mem Consumed"
            read -r mem_criteria
            echo "Searching for processes with CPU usage greater than $mem_criteria%..."
            echo "   PID  %CPU  %MEM  USER  COMM"
            ps -eo pid,%cpu,%mem,comm | awk -v mem="$mem_criteria" '$3 > mem {print $0}'
            ;;
        *)
            echo "Invalid Choice"  # Invalid choice for search criteria
            ;;
    esac
}

process_usage_alert() {    
    # Run ps to get process details, and loop through each line
    ps -eo pid,%cpu,%mem,comm | while read -r line; do
        # Skip the header line
        if [[ "$line" == *"PID"* ]]; then
            continue
        fi

        # Extract PID, CPU usage, and memory usage from the line
        pid_process=$(echo "$line" | awk '{print $1}')
        cpu_usage=$(echo "$line" | awk '{print $2}')
        mem_usage=$(echo "$line" | awk '{print $3}')

        # Compare CPU usage with the threshold
        if (( $(echo "$cpu_usage > $CPU_ALERT_THRESHOLD" | bc -l) )); then
            echo "ALERT: Process (PID $pid_process) is using $cpu_usage% CPU, exceeding the $CPU_ALERT_THRESHOLD% threshold."
        else
            echo "Process (PID $pid_process) is using $cpu_usage% CPU, doesn't exceeding the $CPU_ALERT_THRESHOLD% threshold."
        fi

        # Compare Mem usage with the threshold
        if (( $(echo "$mem_usage > $MEMORY_ALERT_THRESHOLD" | bc -l) )); then
            echo "ALERT: Process (PID $pid_process) is using $mem_usage% MEM, exceeding the $MEMORY_ALERT_THRESHOLD% threshold."
        else    
            echo "Process (PID $pid_process) is using $mem_usage% MEM, doesn't exceeding the $MEMORY_ALERT_THRESHOLD% threshold."
        fi
    done
}

# Run processmonitor function 
process_monitor