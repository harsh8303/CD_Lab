#!/bin/bash

# LONG HARD CODING QUESTION 16
# Write a shell script to check whether a given string is palindrome.

echo "Enter string:"
read str

rev=$(echo "$str" | rev)

if [ "$str" = "$rev" ]
then
 echo "Palindrome string"
else
 echo "Not a palindrome"
fi


# LONG HARD CODING QUESTION 17
# Write a shell script to count vowels, consonants, digits and special characters in a string.

echo "Enter string:"
read str

v=$(echo "$str" | grep -o -i "[aeiou]" | wc -l)
c=$(echo "$str" | grep -o -i "[bcdfghjklmnpqrstvwxyz]" | wc -l)
d=$(echo "$str" | grep -o "[0-9]" | wc -l)
s=$(echo "$str" | grep -o "[^a-zA-Z0-9]" | wc -l)

echo "Vowels = $v"
echo "Consonants = $c"
echo "Digits = $d"
echo "Special Characters = $s"


# LONG HARD CODING QUESTION 18
# Write a shell script to find sum and average of n numbers.

echo "Enter numbers (space separated):"
read nums

sum=0
count=0

for i in $nums
do
 sum=$((sum+i))
 count=$((count+1))
done

avg=$(echo "$sum/$count" | bc -l)

echo "Sum = $sum"
echo "Average = $avg"


# LONG HARD CODING QUESTION 19
# Write a shell script to display files having read, write and execute permission.

echo "Files with rwx permission:"
ls -l | awk '$1 ~ /^-rwx/ {print $9}'


# LONG HARD CODING QUESTION 20
# Write a shell script to check whether a file is empty or not.

echo "Enter filename:"
read file

if [ -s $file ]
then
 echo "File is not empty"
else
 echo "File is empty"
fi


# LONG HARD CODING QUESTION 21
# Write a shell script to rename all .txt files to .bak.

for f in *.txt
do
 mv "$f" "${f%.txt}.bak"
done
echo "All .txt files renamed to .bak"


# LONG HARD CODING QUESTION 22
# Write a shell script to find largest and smallest number from user input.

echo "Enter numbers:"
read nums

max=$(echo $nums | tr ' ' '\n' | sort -n | tail -1)
min=$(echo $nums | tr ' ' '\n' | sort -n | head -1)

echo "Largest = $max"
echo "Smallest = $min"


# LONG HARD CODING QUESTION 23
# Write a shell script to count number of files and directories in current directory.

files=$(ls -l | grep "^-" | wc -l)
dirs=$(ls -l | grep "^d" | wc -l)

echo "Files = $files"
echo "Directories = $dirs"


# LONG HARD CODING QUESTION 24
# Write a shell script to display top 5 memory consuming processes.

ps aux --sort=-%mem | head -6


# LONG HARD CODING QUESTION 25
# Write a shell script to check whether a command exists in the system.

echo "Enter command name:"
read cmd

if command -v $cmd >/dev/null
then
 echo "Command exists"
else
 echo "Command not found"
fi


# LONG HARD CODING QUESTION 26
# Write a shell script to backup a directory with date.

echo "Enter directory name:"
read dir

if [ -d $dir ]
then
 tar -czf "${dir}_backup_$(date +%F).tar.gz" $dir
 echo "Backup created"
else
 echo "Directory not found"
fi


# LONG HARD CODING QUESTION 27
# Write a shell script to find lines containing a word and print line number.

echo "Enter filename:"
read file
echo "Enter word:"
read word

grep -n "$word" $file


# LONG HARD CODING QUESTION 28
# Write a shell script to delete lines containing a specific word from a file.

echo "Enter filename:"
read file
echo "Enter word to delete:"
read word

grep -v "$word" $file > temp
mv temp $file
echo "Lines deleted"


# LONG HARD CODING QUESTION 29
# Write a shell script to monitor disk usage and warn if usage exceeds 80%.

usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ $usage -gt 80 ]
then
 echo "Warning: Disk usage above 80%"
else
 echo "Disk usage normal"
fi


# LONG HARD CODING QUESTION 30
# Write a shell script to print multiplication table of a number.

echo "Enter number:"
read n

for ((i=1;i<=10;i++))
do
 echo "$n x $i = $((n*i))"
done
