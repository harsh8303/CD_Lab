#!/bin/bash

# LONG HARD CODING QUESTION 31
# Write a shell script to create a file, write data into it, then read and display it.

echo "Enter filename:"
read file

echo "Enter text (Ctrl+D to save):"
cat > $file

echo "File content:"
cat $file


# LONG HARD CODING QUESTION 32
# Write a shell script to copy contents of one file to another and count lines copied.

echo "Enter source file:"
read src
echo "Enter destination file:"
read dest

if [ -f $src ]
then
 cp $src $dest
 lines=$(wc -l < $src)
 echo "Copied successfully"
 echo "Lines copied = $lines"
else
 echo "Source file not found"
fi


# LONG HARD CODING QUESTION 33
# Write a shell script to run a process in background and display its PID.

sleep 100 &
pid=$!
echo "Process started in background"
echo "PID = $pid"


# LONG HARD CODING QUESTION 34
# Write a shell script to terminate a process using PID.

echo "Enter PID to kill:"
read pid

if kill $pid 2>/dev/null
then
 echo "Process terminated"
else
 echo "Invalid PID or permission denied"
fi


# LONG HARD CODING QUESTION 35
# Write a shell script to handle SIGINT (Ctrl+C) using trap.

trap 'echo "SIGINT caught. Exiting safely"; exit' SIGINT

echo "Press Ctrl+C to test signal handling"
while true
do
 sleep 1
done


# LONG HARD CODING QUESTION 36
# Write a shell script to handle multiple signals using trap.

trap 'echo "SIGINT received"; exit' SIGINT
trap 'echo "SIGTERM received"; exit' SIGTERM

echo "Running... PID = $$"
while true
do
 sleep 2
done


# LONG HARD CODING QUESTION 37
# Write a shell script to clean temporary files on exit using trap.

trap 'rm -f /tmp/tempfile_$$; echo "Temporary file deleted"' EXIT

touch /tmp/tempfile_$$
echo "Temporary file created: /tmp/tempfile_$$"
sleep 10


# LONG HARD CODING QUESTION 38
# Write a shell script to monitor a file for changes.

echo "Enter filename to monitor:"
read file

if [ ! -f $file ]
then
 echo "File not found"
 exit
fi

old=$(ls -l $file)

while true
do
 new=$(ls -l $file)
 if [ "$old" != "$new" ]
 then
  echo "File changed"
  old=$new
 fi
 sleep 2
done


# LONG HARD CODING QUESTION 39
# Write a shell script to implement file locking using PID.

lockfile="/tmp/mylockfile"

if [ -f $lockfile ]
then
 echo "Another instance is running"
 exit
fi

echo $$ > $lockfile
echo "Lock acquired"

sleep 15

rm -f $lockfile
echo "Lock released"


# LONG HARD CODING QUESTION 40
# Write a shell script to execute another script and capture its exit status.

echo "Enter script name:"
read script

bash $script
status=$?

echo "Exit status of script = $status"


# LONG HARD CODING QUESTION 41
# Write a shell script to redirect both stdout and stderr to a file.

echo "Redirecting output and error"
ls validfile invalidfile > output.log 2>&1
echo "Check output.log"


# LONG HARD CODING QUESTION 42
# Write a shell script to list zombie processes.

ps aux | awk '$8=="Z" {print $2, $11}'


# LONG HARD CODING QUESTION 43
# Write a shell script to create child process and show parent-child relationship.

echo "Parent PID = $$"

(
 echo "Child PID = $$"
 sleep 5
) &

wait
echo "Child process finished"


# LONG HARD CODING QUESTION 44
# Write a shell script to schedule a command using at (if available).

echo "echo Hello from at command" | at now + 1 minute


# LONG HARD CODING QUESTION 45
# Write a shell script to find files modified in last 24 hours.

find . -type f -mtime -1


# LONG HARD CODING QUESTION 46
# Write a shell script to detect orphan processes.

ps -ef | awk '$3==1 {print $2, $8}'


# LONG HARD CODING QUESTION 47
# Write a shell script to safely delete a file (move to trash).

trash="$HOME/.trash"
mkdir -p $trash

echo "Enter file to delete safely:"
read file

if [ -f $file ]
then
 mv $file $trash/
 echo "File moved to trash"
else
 echo "File not found"
fi


# LONG HARD CODING QUESTION 48
# Write a shell script to monitor CPU usage and alert if above threshold.

cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

if (( $(echo "$cpu > 80" | bc -l) ))
then
 echo "High CPU usage: $cpu%"
else
 echo "CPU usage normal: $cpu%"
fi


# LONG HARD CODING QUESTION 49
# Write a shell script to run multiple commands and stop if any fails.

set -e
echo "Running command 1"
ls
echo "Running command 2"
false
echo "This line will not execute"


# LONG HARD CODING QUESTION 50
# Write a shell script to demonstrate trap with ERR signal.

trap 'echo "Error occurred at line $LINENO"; exit 1' ERR

echo "Running safe command"
ls
echo "Running error command"
false
echo "This will not run"
