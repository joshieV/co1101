#!/bin/bash
# Author: Joshua
# Reviewer: 
# Student ID: 269027194

set -u

LOG_FILE="session.log"

log_action() {
    echo "$(date) : $1" >> "$LOG_FILE"
}

do_files() {
    read -p "Enter group name for files.sh: " group
    if [ -z "$group" ]; then
        echo "Error: Group name cannot be empty!"
        return
    fi

    ./files.sh "$group"
    log_action "Ran files.sh for group '$group'"
}

do_calc() {
    read -p "First number: " num1
    read -p "Second number: " num2

    ./calc.sh "$num1" "$num2"
    log_action "Ran calc.sh with $num1 and $num2"
}

do_loops() {
    ./loops.sh
    log_action "Ran loops.sh"
}

do_log() {
    echo "--- session.log ---"
    if [ -f "$LOG_FILE" ]; then
        cat "$LOG_FILE"
    else
        echo "No actions logged yet"
    fi
}

do_quit() {
    read -p "Delete session.log? (y/n): " ans
    if [ "$ans" = "y" ] && [ -f "$LOG_FILE" ]; then
        rm -f "$LOG_FILE"
        echo "session.log deleted"
    fi
    echo "Goodbye"
}

while true; do
    echo "==== Study Group Toolkit ===="
    echo "1) Create a group folder (files.sh)"
    echo "2) Calculator (calc.sh)"
    echo "3) Number tools (loops.sh)"
    echo "4) Show session log"
    echo "5) Quit"
    read -p "Choice: " choice
    
    case "$choice" in
        1) do_files ;;
        2) do_calc ;;
        3) do_loops ;;
        4) do_log ;;
        5) do_quit; break ;;
        *) echo "Invalid choice" ;;
    esac
done