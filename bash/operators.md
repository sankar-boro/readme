In **Bash**, different contexts (arithmetic, string comparison, and file tests) have distinct operators. Here’s a complete breakdown:

---

## 🔢 **Arithmetic Operators** (`[ ... ]`, `(( ... ))`)
Used for integer comparison and arithmetic operations.

### ✅ **Comparison Operators**
| Operator | Meaning               | Example (`[ ]`)           | Example (`(( ))`)        |
|----------|-----------------------|---------------------------|--------------------------|
| `-eq`    | Equal to              | `[ "$a" -eq "$b" ]`       | `(( a == b ))`           |
| `-ne`    | Not equal to          | `[ "$a" -ne "$b" ]`       | `(( a != b ))`           |
| `-lt`    | Less than (`<`)       | `[ "$a" -lt "$b" ]`       | `(( a < b ))`            |
| `-le`    | Less than or equal to (`<=`)| `[ "$a" -le "$b" ]` | `(( a <= b ))`           |
| `-gt`    | Greater than (`>`)    | `[ "$a" -gt "$b" ]`       | `(( a > b ))`            |
| `-ge`    | Greater than or equal to (`>=`)| `[ "$a" -ge "$b" ]` | `(( a >= b ))` |

### ➕ **Arithmetic Operations** (inside `(( ... ))`)
| Operator | Description    | Example          |
|----------|----------------|------------------|
| `+`      | Addition        | `(( a + b ))`    |
| `-`      | Subtraction     | `(( a - b ))`    |
| `*`      | Multiplication  | `(( a * b ))`    |
| `/`      | Division        | `(( a / b ))`    |
| `%`      | Modulus         | `(( a % b ))`    |
| `**`     | Exponentiation  | `(( a ** b ))`   |

---

## 🔤 **String Comparison Operators** (`[ ... ]` or `[[ ... ]]`)
Used for string evaluations.

| Operator | Meaning                        | Example                     |
|----------|---------------------------------|-----------------------------|
| `=`      | Equal to                        | `[ "$a" = "$b" ]`           |
| `==`     | Equal to (preferred in `[[ ]]`)  | `[[ "$a" == "$b" ]]`        |
| `!=`     | Not equal to                    | `[[ "$a" != "$b" ]]`        |
| `<`      | Lexicographically less than     | `[[ "$a" < "$b" ]]`         |
| `>`      | Lexicographically greater than  | `[[ "$a" > "$b" ]]`         |
| `-z`     | String is null (empty)          | `[ -z "$a" ]`               |
| `-n`     | String is not null (non-empty)  | `[ -n "$a" ]`               |

---

## 📁 **File Test Operators** (`[ ... ]` or `[[ ... ]]`)
Used to test file types and permissions.

### ✅ **File Types**
| Operator | Description                    | Example               |
|----------|--------------------------------|-----------------------|
| `-e`     | File exists                     | `[ -e file.txt ]`     |
| `-f`     | Regular file                    | `[ -f file.txt ]`     |
| `-d`     | Directory                       | `[ -d mydir ]`        |
| `-L`     | Symbolic link                   | `[ -L link ]`         |
| `-b`     | Block device                    | `[ -b /dev/sda1 ]`    |
| `-c`     | Character device                | `[ -c /dev/tty0 ]`    |

### 🔒 **File Permissions**
| Operator | Description                     | Example                 |
|----------|----------------------------------|-------------------------|
| `-r`     | File is readable                 | `[ -r file.txt ]`       |
| `-w`     | File is writable                 | `[ -w file.txt ]`       |
| `-x`     | File is executable               | `[ -x script.sh ]`      |
| `-s`     | File is not empty (size > 0)     | `[ -s file.txt ]`       |

### ⚡ **File Comparisons**
| Operator | Description                           | Example                  |
|----------|---------------------------------------|--------------------------|
| `-nt`    | Newer than                            | `[ file1.txt -nt file2.txt ]` |
| `-ot`    | Older than                            | `[ file1.txt -ot file2.txt ]` |
| `-ef`    | Same file (hard link)                 | `[ file1.txt -ef file2.txt ]` |

---

## 🏗️ **Logical Operators**
Combine multiple conditions.

| Operator | Meaning                | Example                      |
|----------|------------------------|------------------------------|
| `!`      | NOT                    | `[ ! -f file.txt ]`          |
| `-a`     | AND (in `[ ... ]`)     | `[ -f file.txt -a -r file.txt ]` |
| `-o`     | OR (in `[ ... ]`)      | `[ -f file.txt -o -d mydir ]` |
| `&&`     | AND (preferred)        | `[[ -f file.txt && -r file.txt ]]` |
| `||`     | OR (preferred)         | `[[ -f file.txt || -d mydir ]]`   |

---

### 📏 **Other `-size` Suffixes in `find`**  
| Suffix | Unit          | Example      | Meaning                  |
|--------|---------------|--------------|--------------------------|
| `c`    | Bytes         | `-size 100c` | Exactly 100 bytes        |
| `k`    | Kilobytes     | `-size +1k`  | More than 1 KB           |
| `M`    | Megabytes     | `-size 10M`  | Exactly 10 MB            |
| `G`    | Gigabytes     | `-size -1G`  | Less than 1 GB           |
| `b`    | 512-byte blocks| `-size 1b`  | Exactly 512 bytes        |

---

## 🎯 **Example Usage**

```bash
#!/bin/bash

num=10
str="hello"
file="myfile.txt"

# Arithmetic comparison
if (( num > 5 )); then
  echo "$num is greater than 5"
fi

# String comparison
if [[ "$str" == "hello" ]]; then
  echo "String matches 'hello'"
fi

# File test
if [[ -f "$file" && -r "$file" ]]; then
  echo "$file exists and is readable"
else
  echo "$file does not exist or is not readable"
fi
```

---

### 💡 **Pro Tips:**
- Use `[[ ... ]]` over `[ ... ]` when possible (supports `&&`, `||`, `<`, `>` for strings without escaping).  
- Double parentheses `(( ... ))` simplify arithmetic comparisons.  
- Always quote variables (`"$var"`) to avoid word splitting issues.

---

Awesome! Here are some **advanced examples** combining loops, file operations, and conditional logic in **Bash** using the operators we discussed.

---

### 🔄 **1. Loop Through Files and Check Conditions**
**Description:** Iterate over `.txt` files and check if they are readable and not empty.

```bash
#!/bin/bash

for file in *.txt; do
  if [[ -f "$file" && -r "$file" && -s "$file" ]]; then
    echo "$file is readable and not empty."
  else
    echo "$file is either not readable or empty."
  fi
done
```

---

### 📚 **2. Combine Multiple Conditions with Logical Operators**
**Description:** Check disk space and restart a service if low space is detected.

```bash
#!/bin/bash

disk_space=$(df / | awk 'END {print $5}' | tr -d '%')  # Get disk usage percentage

if (( disk_space > 80 )); then
  echo "Disk usage is above 80% ($disk_space%). Restarting service..."
  systemctl restart apache2 && echo "Service restarted successfully." || echo "Failed to restart service."
else
  echo "Disk usage is under control at $disk_space%."
fi
```

---

### 🕑 **3. Retry a Command with While Loop (Polling Pattern)**
**Description:** Retry checking a URL until it becomes reachable or max attempts are reached.

```bash
#!/bin/bash

url="https://example.com"
attempts=0
max_attempts=5

while [[ $attempts -lt $max_attempts ]]; do
  if curl --output /dev/null --silent --head --fail "$url"; then
    echo "$url is reachable ✅"
    break
  else
    ((attempts++))
    echo "Attempt $attempts: $url not reachable. Retrying in 5 seconds..."
    sleep 5
  fi
done

if (( attempts == max_attempts )); then
  echo "❌ $url is unreachable after $max_attempts attempts."
fi
```

---

### 🗂️ **4. Nested Conditions with Case Statements**
**Description:** Check user input with multiple conditions.

```bash
#!/bin/bash

read -p "Enter [start|stop|restart]: " action

case $action in
  start)
    echo "Starting service..."
    systemctl start apache2 && echo "Service started."
    ;;
  stop)
    echo "Stopping service..."
    systemctl stop apache2 && echo "Service stopped."
    ;;
  restart)
    echo "Restarting service..."
    systemctl restart apache2 && echo "Service restarted."
    ;;
  *)
    echo "Invalid action. Use start, stop, or restart."
    ;;
esac
```

---

### 🧪 **5. Using `find` with `while` for Advanced File Processing**
**Description:** Find all `.log` files and compress them if they are older than 7 days.

```bash
#!/bin/bash

find /var/log -type f -name "*.log" -mtime +7 | while read -r logfile; do
  echo "Compressing $logfile ..."
  gzip "$logfile" && echo "$logfile compressed successfully." || echo "Failed to compress $logfile."
done
```

---

### 💥 **6. Complex Condition Combining Arithmetic and String Logic**
**Description:** Check user age and role for access.

```bash
#!/bin/bash

read -p "Enter your age: " age
read -p "Enter your role (admin/user): " role

if (( age >= 18 )) && [[ "$role" == "admin" ]]; then
  echo "Access granted: Admin privileges enabled. 🔐"
elif (( age >= 18 )) && [[ "$role" == "user" ]]; then
  echo "Access granted: User privileges enabled. 🔓"
else
  echo "Access denied: You must be at least 18 and have the correct role. 🚫"
fi
```

---

### ⚡ **Key Concepts Demonstrated:**
- `&&` and `||` for command chaining.
- Nested `if-else` for complex logic.
- `case` for pattern matching.
- `find` combined with `while` for file processing.
- Error handling using `||` after commands.

---

### 🔥 **Bonus: One-Liner Conditional Execution**
```bash
[[ -f "config.cfg" ]] && echo "Config exists." || echo "Config missing."
```

---

Let me know if you want further breakdowns, optimizations, or specific real-world use cases! 🚀