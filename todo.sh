#!/bin/bash

TODO_FILE="todo.txt"

# Define colors
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
CYAN="\033[36m"
RESET="\033[0m"

# Create the file if it doesn't exist
if [ ! -f $TODO_FILE ]; then
    touch $TODO_FILE
fi

# Functions
add_task() {
    echo "${CYAN}Enter task description:${RESET}"
    read task
    echo "${CYAN}Enter due date (YYYY-MM-DD):${RESET}"
    read due_date
    echo "${CYAN}Enter priority (High/Medium/Low):${RESET}"
    read priority
    echo "$task|$due_date|$priority|Pending" >> $TODO_FILE
    echo "${GREEN}✅ Task added successfully!${RESET}"
}

view_tasks() {
    if [ ! -s $TODO_FILE ]; then
        echo "${YELLOW}📂 No tasks available.${RESET}"
        return
    fi
    echo "${BLUE}📋 Current To-Do List:${RESET}"
    printf "%-5s %-30s %-15s %-10s %-10s\n" "No." "Task Description" "Due Date" "Priority" "Status"
    echo "-------------------------------------------------------------------------"
    awk -F "|" '{printf "%-5s %-30s %-15s %-10s %-10s\n", NR, $1, $2, $3, $4}' $TODO_FILE
    echo "-------------------------------------------------------------------------"
}

delete_task() {
    view_tasks
    echo "${CYAN}Enter task number to delete:${RESET}"
    read task_number
    sed -i "${task_number}d" $TODO_FILE
    echo "${RED}🗑️ Task deleted successfully!${RESET}"
}

mark_complete() {
    view_tasks
    echo "${CYAN}Enter task number to mark as completed:${RESET}"
    read task_number
    sed -i "${task_number}s/Pending/Completed/" $TODO_FILE
    echo "${GREEN}✔️ Task marked as completed!${RESET}"
}

edit_task() {
    view_tasks
    echo "${CYAN}Enter task number to edit:${RESET}"
    read task_number
    old_task=$(sed -n "${task_number}p" $TODO_FILE)
    echo "${YELLOW}Old Task: ${old_task}${RESET}"
    echo "${CYAN}Enter new task description (leave blank to keep unchanged):${RESET}"
    read new_task
    echo "${CYAN}Enter new due date (YYYY-MM-DD, leave blank to keep unchanged):${RESET}"
    read new_due_date
    echo "${CYAN}Enter new priority (High/Medium/Low, leave blank to keep unchanged):${RESET}"
    read new_priority

    task=$(echo "$old_task" | cut -d '|' -f 1)
    due_date=$(echo "$old_task" | cut -d '|' -f 2)
    priority=$(echo "$old_task" | cut -d '|' -f 3)
    status=$(echo "$old_task" | cut -d '|' -f 4)

    new_task=${new_task:-$task}
    new_due_date=${new_due_date:-$due_date}
    new_priority=${new_priority:-$priority}

    new_entry="$new_task|$new_due_date|$new_priority|$status"
    sed -i "${task_number}s|.*|$new_entry|" $TODO_FILE
    echo "${GREEN}✏️ Task edited successfully!${RESET}"
}

search_task() {
    echo "${CYAN}Enter keyword to search:${RESET}"
    read keyword
    echo "${BLUE}🔍 Search results:${RESET}"
    grep -in "$keyword" $TODO_FILE | column -s '|' -t
}

sort_tasks() {
    echo "${CYAN}Sort by:${RESET}"
    echo "1. Due Date"
    echo "2. Priority"
    read choice
    if [ "$choice" -eq 1 ]; then
        echo "${BLUE}📅 Sorting by Due Date:${RESET}"
        sort -t '|' -k 2 $TODO_FILE | column -s '|' -t
    elif [ "$choice" -eq 2 ]; then
        echo "${BLUE}📌 Sorting by Priority:${RESET}"
        sort -t '|' -k 3 $TODO_FILE | column -s '|' -t
    else
        echo "${RED}⚠️ Invalid choice!${RESET}"
    fi
}

generate_report() {
    echo "${BLUE}📊 Generating report...${RESET}"
    echo "----------------------------"
    echo "${YELLOW}Pending Tasks:${RESET}"
    grep "Pending" $TODO_FILE | column -s '|' -t
    echo "----------------------------"
    echo "${GREEN}Completed Tasks:${RESET}"
    grep "Completed" $TODO_FILE | column -s '|' -t
    echo "----------------------------"
}

# Menu
while true; do
    echo "${CYAN}📝 To-Do List Manager${RESET}"
    echo "${BLUE}----------------------${RESET}"
    echo "1. Add Task"
    echo "2. View Tasks"
    echo "3. Delete Task"
    echo "4. Mark Task as Completed"
    echo "5. Edit Task"
    echo "6. Search Tasks"
    echo "7. Sort Tasks"
    echo "8. Generate Report"
    echo "9. Exit"
    echo "${CYAN}Enter your choice:${RESET}"
    read choice

    case $choice in
    1) add_task ;;
    2) view_tasks ;;
    3) delete_task ;;
    4) mark_complete ;;
    5) edit_task ;;
    6) search_task ;;
    7) sort_tasks ;;
    8) generate_report ;;
    9) echo "${GREEN}👋 Exiting...${RESET}"; exit ;;
    *) echo "${RED}⚠️ Invalid choice! Please try again.${RESET}" ;;
    esac
done
