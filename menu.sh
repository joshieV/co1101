#!/bin/bash
# Author: Joshua
# Reviewer: 
# Student ID: 269027194

set -u

#log file to keep track of actions performed during the session
LOG_FILE="session.log"

#log_action function appends a log entry with the current date and the action description to the session.log file
log_action() {
    echo "$(date) : $1" >> "$LOG_FILE"
}

#do_files function prompts the user for a group name, checks if it's empty, and runs files.sh with that group name.
#It also logs the action
do_files() {
    read -p "Enter group name for files.sh: " group
    if [ -z "$group" ]; then #if the group name is empty, print an error message and return to the menu
        echo "Error: Group name cannot be empty!"
        return
    fi

    ./files.sh "$group" #run files.sh with the specified group name
    log_action "Ran files.sh for group '$group'" #log the action of running files.sh with the specified group name
}

#do_calc function prompts the user for two numbers, runs calc.sh with those numbers, and logs the action
do_calc() {
    #takea two numbers as input from the user and run calc.sh with those numbers
    read -p "First number: " num1
    read -p "Second number: " num2

    ./calc.sh "$num1" "$num2" #run calc.sh with the specified numbers
    log_action "Ran calc.sh with $num1 and $num2" #log the action of running calc.sh with the specified numbers
}

#do_loops function runs loops.sh and logs the action
do_loops() {
    ./loops.sh #run loops.sh
    log_action "Ran loops.sh"
}

#do_log function displays the contents of the session.log file if it exists, or a message indicating that no actions have been logged yet
do_log() {
    echo "--- session.log ---"
    if [ -f "$LOG_FILE" ]; then #if the log file exists, display its contents
        cat "$LOG_FILE"
    else
        echo "No actions logged yet"
    fi
}

#do_quit function prompts the user to delete the session.log file, deletes it if the user confirms, and prints a goodbye message
do_quit() {
    read -p "Delete session.log? (y/n): " ans
    if [ "$ans" = "y" ] && [ -f "$LOG_FILE" ]; then #if the user confirms and the log file exists, delete it
        rm -f "$LOG_FILE"
        echo "session.log deleted"
    fi
    echo "Goodbye"
}

# Main menu loop
while true; do
    echo "==== Study Group Toolkit ===="
    echo "1) Create a group folder (files.sh)"
    echo "2) Calculator (calc.sh)"
    echo "3) Number tools (loops.sh)"
    echo "4) Show session log"
    echo "5) Quit"
    read -p "Choice: " choice
    
    #case statement to handle the user's choice and call the appropriate function
    case "$choice" in
        1) do_files ;;
        2) do_calc ;;
        3) do_loops ;;
        4) do_log ;;
        5) do_quit; break ;;
        *) echo "Invalid choice" ;;
    esac
done