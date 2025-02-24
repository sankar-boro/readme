Here are some **basic Bash commands** for beginners, along with explanations:

### 📁 **File and Directory Commands**
- **`pwd`** – Print working directory (shows current directory path)  
  ```bash
  pwd
  ```
- **`ls`** – List files and directories  
  ```bash
  ls          # List files
  ls -l       # List with details
  ls -a       # Include hidden files
  ```
- **`cd`** – Change directory  
  ```bash
  cd /path/to/directory   # Navigate to a specific directory
  cd ..                   # Go one directory up
  cd ~                    # Go to the home directory
  ```

- **`mkdir`** – Make new directory  
  ```bash
  mkdir my_folder         # Create a folder named 'my_folder'
  mkdir -p a/b/c          # Create nested directories
  ```

- **`rmdir`** – Remove empty directory  
  ```bash
  rmdir my_folder
  ```

- **`rm`** – Remove files or directories  
  ```bash
  rm file.txt             # Delete file
  rm -r folder            # Delete folder recursively
  rm -rf folder           # Force delete without prompts
  ```

- **`touch`** – Create an empty file  
  ```bash
  touch file.txt
  ```

- **`cp`** – Copy files or directories  
  ```bash
  cp file1.txt file2.txt           # Copy file
  cp -r folder1/ folder2/          # Copy directory recursively
  ```

- **`mv`** – Move or rename files/directories  
  ```bash
  mv oldname.txt newname.txt       # Rename file
  mv file.txt /destination/folder  # Move file
  ```

---

### 📄 **Viewing and Editing Files**
- **`cat`** – View file content  
  ```bash
  cat file.txt
  ```

- **`less`** – View file content (scrollable)  
  ```bash
  less file.txt
  ```

- **`head`** – View the first 10 lines of a file  
  ```bash
  head file.txt
  head -n 20 file.txt  # First 20 lines
  ```

- **`tail`** – View the last 10 lines of a file  
  ```bash
  tail file.txt
  tail -f file.txt     # Follow file updates (like logs)
  ```

- **`nano`** or **`vim`** – Edit file in terminal  
  ```bash
  nano file.txt
  vim file.txt
  ```

---

### 🔧 **System and User Information**
- **`whoami`** – Display current user  
  ```bash
  whoami
  ```

- **`hostname`** – Show system's hostname  
  ```bash
  hostname
  ```

- **`date`** – Display current date and time  
  ```bash
  date
  ```

- **`uptime`** – Show how long the system has been running  
  ```bash
  uptime
  ```

- **`top`** – Display running processes  
  ```bash
  top
  ```

---

### 🏃 **Process Management**
- **`ps`** – Show running processes  
  ```bash
  ps             # Processes in current shell
  ps aux         # All running processes
  ```

- **`kill`** – Kill a process by PID  
  ```bash
  kill 1234      # Replace 1234 with the actual process ID
  ```

---

### 📝 **Permissions**
- **`chmod`** – Change file permissions  
  ```bash
  chmod +x script.sh    # Make a script executable
  ```

- **`chown`** – Change file owner  
  ```bash
  sudo chown user:group file.txt
  ```

---

### 🌐 **Networking**
- **`ping`** – Check network connection  
  ```bash
  ping google.com
  ```

- **`curl`** – Fetch data from URL  
  ```bash
  curl https://example.com
  ```

---

### ⚡ **Other Useful Commands**
- **`echo`** – Print text to terminal  
  ```bash
  echo "Hello, World!"
  ```

- **`history`** – Show command history  
  ```bash
  history
  ```

- **`clear`** – Clear the terminal screen  
  ```bash
  clear
  ```

- **`man`** – Display manual for a command  
  ```bash
  man ls   # Shows manual for 'ls' command
  ```

---

### 💡 **Combining Commands**
- **Chaining commands** using `&&` (runs second command if first succeeds):  
  ```bash
  mkdir new_folder && cd new_folder
  ```

- **Pipe (`|`)** – Send output of one command as input to another:  
  ```bash
  ls -l | grep "txt"   # Find files with 'txt' in the name
  ```

- **Redirect output** to a file:  
  ```bash
  ls > file_list.txt          # Overwrite file
  ls >> file_list.txt         # Append to file
  ```

---

### 🎯 **Bonus Tips**  
- Use **Tab** for autocompletion.  
- Use **Ctrl + C** to stop a running command.  
- Use **Ctrl + L** to clear the terminal screen (like `clear`).  
- Use **Ctrl + R** to search command history.

---

Would you like more examples, explanations on scripting, or common use cases? 😊