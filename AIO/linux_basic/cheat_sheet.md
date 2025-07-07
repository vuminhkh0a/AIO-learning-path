# Unix/Linux Cheat Sheet for Data Science

## Navigation & File System

| Command | Description              | Example                   |
| ------- | ------------------------ | ------------------------- |
| `pwd`   | Show current directory   | `pwd`                     |
| `cd`    | Change directory         | `cd data/` `cd ..` `cd ~` |
| `ls`    | List files               | `ls -la` `ls -lh`         |
| `tree`  | Show directory structure | `tree .` `tree -L 2`      |
| `find`  | Find files/directories   | `find . -name "*.csv"`    |

## File Operations

| Command | Description       | Example                                       |
| ------- | ----------------- | --------------------------------------------- |
| `mkdir` | Create directory  | `mkdir data` `mkdir -p data/raw`              |
| `touch` | Create empty file | `touch file.txt`                              |
| `cp`    | Copy files        | `cp file.txt backup.txt` `cp -r dir/ backup/` |
| `mv`    | Move/rename       | `mv old.txt new.txt`                          |
| `rm`    | Delete files      | `rm file.txt` `rm -rf directory/` ⚠️          |

## File Content Viewing

| Command   | Description              | Example               | When to Use          |
| --------- | ------------------------ | --------------------- | -------------------- |
| `cat`     | Show entire file         | `cat small_file.txt`  | Small files only     |
| `less`    | View file page by page   | `less large_file.csv` | Large files          |
| `head`    | Show first N lines       | `head -10 data.csv`   | Check file structure |
| `tail`    | Show last N lines        | `tail -20 log.txt`    | Recent entries       |
| `tail -f` | Follow file in real-time | `tail -f live.log`    | Live monitoring      |

### **less Navigation Keys**

- `Space` - Next page
- `b` - Previous page
- `/pattern` - Search forward
- `q` - Quit

## Search & Filter

### **grep - Pattern Matching**

| Command          | Description        | Example                      |
| ---------------- | ------------------ | ---------------------------- |
| `grep "pattern"` | Basic search       | `grep "error" log.txt`       |
| `grep -i`        | Case insensitive   | `grep -i "ERROR" log.txt`    |
| `grep -c`        | Count matches      | `grep -c "GET" access.log`   |
| `grep -v`        | Invert match (NOT) | `grep -v "INFO" log.txt`     |
| `grep -n`        | Show line numbers  | `grep -n "import" script.py` |
| `grep -r`        | Recursive search   | `grep -r "TODO" src/`        |

### **find - File Search**

```bash
find . -name "*.csv"              # Find CSV files
find . -size +100M                # Files larger than 100MB
find . -mtime -7                  # Modified in last 7 days
find . -type f -name "*.py"       # Python files only
```

## Text Processing & Analysis

### **Basic Text Tools**

| Command | Description       | Example                                |
| ------- | ----------------- | -------------------------------------- |
| `wc -l` | Count lines       | `wc -l dataset.csv`                    |
| `sort`  | Sort lines        | `sort names.txt` `sort -n numbers.txt` |
| `uniq`  | Remove duplicates | `sort data.txt \| uniq`                |
| `cut`   | Extract columns   | `cut -d',' -f1,3 data.csv`             |

### **awk - Advanced Processing**

```bash
# Print specific columns
awk -F',' '{print $1, $3}' data.csv

# Calculate sum
awk -F',' '{sum += $3} END {print sum}' sales.csv

# Calculate average
awk -F',' '{sum += $3; count++} END {print sum/count}' data.csv

# Filter and calculate
awk -F',' '$3 > 100 {sum += $3} END {print sum}' sales.csv
```

### **sed - Stream Editor**

```bash
# Replace text
sed 's/old/new/g' file.txt

# Delete lines
sed '1d' file.txt                 # Delete first line (header)
sed '/pattern/d' file.txt         # Delete lines matching pattern

# Extract lines
sed -n '10,20p' file.txt          # Print lines 10-20
```

## Pipes & Redirects

### **Pipe Operators**

| Operator | Description                  | Example                        |
| -------- | ---------------------------- | ------------------------------ |
| `\|`     | Send output to next command  | `cat file.txt \| grep pattern` |
| `>`      | Redirect to file (overwrite) | `ls > file_list.txt`           |
| `>>`     | Redirect to file (append)    | `echo "new line" >> log.txt`   |
| `<`      | Input from file              | `sort < unsorted.txt`          |
| `2>`     | Redirect errors              | `command 2> errors.log`        |
| `2>&1`   | Redirect errors to stdout    | `command > all.log 2>&1`       |

### **Common Pipe Patterns**

```bash
# Count unique values in column
cut -d',' -f2 data.csv | sort | uniq | wc -l

# Top 10 most frequent values
cut -d',' -f2 data.csv | sort | uniq -c | sort -nr | head -10

# Filter and count
grep "2024" sales.csv | cut -d',' -f3 | awk '{sum+=$1} END {print sum}'
```

## JSON Processing with jq

| Command         | Description            | Example                          |
| --------------- | ---------------------- | -------------------------------- |
| `jq .`          | Pretty print JSON      | `cat data.json \| jq .`          |
| `jq '.key'`     | Extract field          | `cat data.json \| jq '.name'`    |
| `jq '.[]'`      | Extract array elements | `cat data.json \| jq '.users[]'` |
| `jq 'select()'` | Filter objects         | `jq '.[] \| select(.age > 25)'`  |

```bash
# Extract specific fields
cat users.json | jq '.[] | {name: .name, age: .age}'

# Calculate average
cat numbers.json | jq '[.[].value] | add / length'

# Filter and transform
cat sales.json | jq '.[] | select(.amount > 1000) | .customer'
```

## Parallel Processing

```bash
# Process files in parallel
find . -name "*.csv" | xargs -P4 -I{} wc -l {}

# Parallel processing with custom command
ls *.txt | xargs -P8 -I{} sh -c 'echo "Processing {}"; grep pattern {}'

# Optimal parallelism
nproc                             # Check CPU cores
xargs -P$(nproc) ...             # Use all cores
```

## File Permissions

### **Permission Format: rwxrwxrwx**

- **First 3**: Owner permissions (user)
- **Middle 3**: Group permissions
- **Last 3**: Other permissions

| Permission | Number | Meaning      |
| ---------- | ------ | ------------ |
| `r--`      | 4      | Read only    |
| `-w-`      | 2      | Write only   |
| `--x`      | 1      | Execute only |
| `rw-`      | 6      | Read + Write |
| `rwx`      | 7      | Full access  |

### **Common chmod Patterns**

```bash
chmod 755 script.sh               # Executable for everyone
chmod 644 data.csv                # Read/write for owner, read for others
chmod 600 secrets.txt             # Owner only
chmod +x script.sh                # Make executable
```

## Process Management

| Command  | Description               | Example                    |
| -------- | ------------------------- | -------------------------- |
| `ps aux` | List all processes        | `ps aux \| grep python`    |
| `top`    | Real-time process monitor | `top`                      |
| `kill`   | Terminate process         | `kill 1234` `kill -9 1234` |
| `nohup`  | Run process in background | `nohup python train.py &`  |
| `jobs`   | List background jobs      | `jobs`                     |

### **Background Processing**

```bash
# Start in background
python long_script.py &

# Send to background
Ctrl+Z                            # Suspend
bg %1                             # Resume in background

# Bring to foreground
fg %1
```

## Data Science Pipelines

### **Customer Analysis Pipeline**

```bash
# Top customers by spending
tail -n +2 customers.csv | sort -t',' -k11 -nr | head -10

# Revenue by category
tail -n +2 sales.csv | cut -d',' -f5,8 | \
awk -F',' '{revenue[$1] += $2} END {for(cat in revenue) print cat": $"revenue[cat]}'

# Customer segmentation
awk -F',' 'NR>1 {if($11>1000) print $1",high"; else print $1",low"}' customers.csv
```

### **Log Analysis Pipeline**

```bash
# Error analysis
grep ERROR app.log | cut -d' ' -f1-2 | sort | uniq -c

# Top IP addresses
cut -d' ' -f1 access.log | sort | uniq -c | sort -nr | head -10

# Hourly traffic pattern
cut -d' ' -f4 access.log | cut -d':' -f2 | sort | uniq -c
```

### **Performance Monitoring**

```bash
# Monitor model training
tail -f training.log | grep -E "(accuracy|loss)"

# System resource usage
top -p $(pgrep python)            # Monitor Python processes

# Disk usage by directory
du -h --max-depth=1 | sort -hr
```

## Emergency Commands

### **When Things Go Wrong**

```bash
# Exit vim
:q!                               # Quit without saving

# Stop runaway process
Ctrl+C                            # Interrupt current command
kill -9 $(pgrep process_name)     # Force kill by name

# Fix permissions
chmod 644 *.txt                   # Fix file permissions
chmod 755 *.sh                    # Fix script permissions

# Recover accidentally deleted files
ls ~/.local/share/Trash/          # Check trash (Ubuntu)
```

### **Common Mistakes & Fixes**

```bash
# Forgot sudo
sudo !!                           # Repeat last command with sudo

# Wrong directory
cd -                              # Go back to previous directory

# Command not found
which command_name                # Check if installed
echo $PATH                        # Check PATH variable

# File not found
ls -la                            # Check current directory
find . -name "filename"           # Search for file
```

## System Information

```bash
# System info
uname -a                          # System information
df -h                             # Disk usage
free -h                           # Memory usage
nproc                             # Number of CPU cores

# Environment
env                               # Environment variables
echo $PATH                        # PATH variable
whoami                            # Current user
pwd                               # Current directory
```

## Quick Examples for Common Tasks

### **Data Exploration**

```bash
# Quick dataset overview
head -5 data.csv && echo "..." && tail -5 data.csv
wc -l *.csv                       # Count rows in all CSV files
cut -d',' -f1 data.csv | head    # Preview first column
```

### **Data Cleaning**

```bash
# Remove empty lines
grep -v "^$" data.txt > cleaned.txt

# Remove duplicates
sort data.txt | uniq > unique.txt

# Replace missing values
sed 's/,,/,NULL,/g' data.csv > cleaned.csv
```

### **Quick Statistics**

```bash
# Count unique values
cut -d',' -f2 data.csv | sort | uniq | wc -l

# Find min/max
cut -d',' -f3 data.csv | sort -n | head -1    # Min
cut -d',' -f3 data.csv | sort -n | tail -1    # Max

# Simple sum
cut -d',' -f3 data.csv | awk '{sum+=$1} END {print sum}'
```

---

## Pro Tips

1. **Use Tab completion** - Type first few letters, press Tab
2. **Use history** - Press ↑ to see previous commands
3. **Use aliases** - `alias ll='ls -la'` for shortcuts
4. **Read man pages** - `man command` for detailed help

## Safety Rules

1. **⚠️ Never `rm -rf /`** - Will delete everything!
2. **Always test on small data first** - Especially with `sed`, `awk`
3. **Use `ls` before `rm`** - Double-check what you're deleting
4. **Backup important files** - `cp important.csv important.backup`
5. **Use version control** - `git` for tracking changes

---

_Need help? Remember: `man command_name` is your friend!_
