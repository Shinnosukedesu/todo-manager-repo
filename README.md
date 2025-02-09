# todo-manager-repo
 Simple todo list manager script with tasks tracking




# 📝 To-Do List Manager Script

## Overview 🚀

Welcome to your **To-Do List Manager**, a simple yet powerful **command-line tool** to help you manage your tasks efficiently. Written in **Bash**, this script allows you to:
- Add, edit, delete, and view tasks
- Mark tasks as completed
- Search, sort, and generate reports

### Run it easily on both **Ubuntu Terminal** and **VS Code Terminal**. This guide will help you set up and get started!

---

## 🎯 Features

- **Task Management**: Add, edit, and delete tasks with ease.
- **Task Prioritization**: Set priority levels (High/Medium/Low) for your tasks.
- **Completion Tracking**: Mark tasks as completed or pending.
- **Search**: Find tasks by description or keyword.
- **Sort**: Sort tasks by due date or priority.
- **Reports**: Generate insightful task reports.

---

## 📥 Installation Instructions

### 1. **Running the Script on Ubuntu Terminal**

#### Step 1: Install Ubuntu
- If Ubuntu isn't installed yet, download it from the [official Ubuntu website](https://ubuntu.com/download/desktop) and follow the instructions.

#### Step 2: Save the Script
- Open a terminal and create a new file called `todo_manager.sh`:
  ```bash
  nano todo_manager.sh
  ```
- Paste the entire script into the file.

#### Step 3: Make the Script Executable
- Run this command to give the script execution permissions:
  ```bash
  chmod +x todo_manager.sh
  ```

#### Step 4: Run the Script
- Now, execute the script:
  ```bash
  ./todo_manager.sh
  ```

---

### 2. **Running the Script on VS Code Terminal** (Optional)

#### Step 1: Install VS Code
- If you don’t have VS Code yet, download it from the [official website](https://code.visualstudio.com/) or use this command:
  ```bash
  sudo snap install --classic code
  ```

#### Step 2: Open the Script in VS Code
- Launch VS Code and open the folder containing the `todo_manager.sh` file, or open the file directly from the terminal:
  ```bash
  code todo_manager.sh
  ```

#### Step 3: Install Bash Support (Optional)
- Enhance your Bash experience by installing the **Bash IDE** extension in VS Code:
  - Press `Ctrl+Shift+X`, search for "Bash IDE", and hit **Install**.

#### Step 4: Run the Script in VS Code Terminal
- Open the integrated terminal with `Ctrl+~` and execute:
  ```bash
  ./todo_manager.sh
  ```

---

## 🌟 How to Use

Once the script is running, you'll be greeted with the main menu:

```bash
📝 To-Do List Manager
----------------------
1. Add Task
2. View Tasks
3. Delete Task
4. Mark Task as Completed
5. Edit Task
6. Search Tasks
7. Sort Tasks
8. Generate Report
9. Exit
Enter your choice:
```

### Example: Adding a New Task

```bash
Enter task description:
Finish Homework
Enter due date (YYYY-MM-DD):
2025-02-15
Enter priority (High/Medium/Low):
High
✅ Task added successfully!
```

---

## 🔧 Troubleshooting

- **Permission Denied?**
  - Ensure the script is executable:
    ```bash
    chmod +x todo_manager.sh
    ```

- **Missing Dependencies?**
  - If you run into missing command errors (like `awk`, `sed`, etc.), install the necessary utilities:
    ```bash
    sudo apt install coreutils sed grep awk
    ```

---

## 📜 License

This project is licensed under the **MIT License**.

---

## 📝 Contribute

Feel free to contribute to the project! Fork it, open issues, or submit pull requests. Your feedback and improvements are always welcome! 😊


