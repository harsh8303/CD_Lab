#!/bin/bash

# LONG CODING QUESTION 1
# Write a shell script to maintain a phonebook.
# Operations: add record, display all, search by name, delete record.

echo "1 Add 2 Display 3 Search 4 Delete"
read ch

case $ch in
1)
 echo "Enter name phone:"
 read name phone
 echo "$name $phone" >> phonebook
 echo "Record added"
 ;;
2)
 if [ -f phonebook ]
 then
  cat phonebook
 else
  echo "Phonebook empty"
 fi
 ;;
3)
 echo "Enter name to search:"
 read name
 grep "^$name" phonebook
 ;;
4)
 echo "Enter name to delete:"
 read name
 grep -v "^$name" phonebook > temp
 mv temp phonebook
 echo "Record deleted"
 ;;
*)
 echo "Invalid choice"
 ;;
esac


# LONG CODING QUESTION 2
# Write a shell script to check whether a number is prime or not using optimized logic.

echo "Enter number:"
read n
flag=0

if [ $n -le 1 ]
then
 echo "Not Prime"
 exit
fi

for ((i=2;i*i<=n;i++))
do
 if [ $((n%i)) -eq 0 ]
 then
  flag=1
  break
 fi
done

[ $flag -eq 0 ] && echo "Prime Number" || echo "Not Prime"


# LONG CODING QUESTION 3
# Write a shell script to find factorial of a number using loop.

echo "Enter number:"
read n
fact=1

for ((i=1;i<=n;i++))
do
 fact=$((fact*i))
done

echo "Factorial = $fact"


# LONG CODING QUESTION 4
# Write a shell script to reverse a number.

echo "Enter number:"
read n
rev=0

while [ $n -gt 0 ]
do
 rem=$((n%10))
 rev=$((rev*10+rem))
 n=$((n/10))
done

echo "Reverse = $rev"


# LONG CODING QUESTION 5
# Write a shell script to check whether a number is palindrome.

echo "Enter number:"
read n
temp=$n
rev=0

while [ $temp -gt 0 ]
do
 rem=$((temp%10))
 rev=$((rev*10+rem))
 temp=$((temp/10))
done

[ $n -eq $rev ] && echo "Palindrome" || echo "Not Palindrome"


# LONG CODING QUESTION 6
# Write a shell script to generate Fibonacci series up to n terms.

echo "Enter number of terms:"
read n
a=0
b=1

echo "Fibonacci Series:"
echo "$a"
echo "$b"

for ((i=3;i<=n;i++))
do
 c=$((a+b))
 echo "$c"
 a=$b
 b=$c
done


# LONG CODING QUESTION 7
# Write a shell script to find largest of three numbers.

echo "Enter three numbers:"
read a b c

if [ $a -ge $b ] && [ $a -ge $c ]
then
 echo "Largest = $a"
elif [ $b -ge $a ] && [ $b -ge $c ]
then
 echo "Largest = $b"
else
 echo "Largest = $c"
fi


# LONG CODING QUESTION 8
# Write a shell script to count number of lines, words and characters in a file.

echo "Enter filename:"
read file

if [ -f $file ]
then
 wc $file
else
 echo "File not found"
fi


# LONG CODING QUESTION 9
# Write a shell script to display file permissions, owner and size.

echo "Enter filename:"
read file

if [ -f $file ]
then
 ls -l $file
else
 echo "File not found"
fi


# LONG CODING QUESTION 10
# Write a shell script to check whether a file exists and whether it is readable, writable and executable.

echo "Enter filename:"
read file

if [ -e $file ]
then
 echo "File exists"
 [ -r $file ] && echo "Readable"
 [ -w $file ] && echo "Writable"
 [ -x $file ] && echo "Executable"
else
 echo "File does not exist"
fi


# LONG CODING QUESTION 11
# Write a shell script to create menu driven calculator using case statement.

echo "1 Add 2 Sub 3 Mul 4 Div"
read ch
read a b

case $ch in
1) echo "Result = $((a+b))" ;;
2) echo "Result = $((a-b))" ;;
3) echo "Result = $((a*b))" ;;
4) [ $b -ne 0 ] && echo "Result = $((a/b))" || echo "Divide by zero" ;;
*) echo "Invalid option" ;;
esac


# LONG CODING QUESTION 12
# Write a shell script to sort numbers entered by user.

echo "Enter numbers:"
read nums
echo $nums | tr ' ' '\n' | sort -n


# LONG CODING QUESTION 13
# Write a shell script to check whether a year is leap year.

echo "Enter year:"
read y

if [ $((y%400)) -eq 0 ] || [ $((y%4)) -eq 0 -a $((y%100)) -ne 0 ]
then
 echo "Leap Year"
else
 echo "Not Leap Year"
fi


# LONG CODING QUESTION 14
# Write a shell script to display system information.

echo "User: $(whoami)"
echo "Date: $(date)"
echo "Uptime:"
uptime
echo "Current Directory:"
pwd


# LONG CODING QUESTION 15
# Write a shell script to delete duplicate lines from a file.

echo "Enter filename:"
read file

if [ -f $file ]
then
 sort $file | uniq
else
 echo "File not found"
fi
