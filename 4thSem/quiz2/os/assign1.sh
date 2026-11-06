#!/bin/bash

# Q1: UNIX / Linux Operating System
# Linux ek multi-user aur multitasking operating system hai.
# Multi-user: ek hi system par multiple users kaam kar sakte hain.
# Multitasking: ek hi user multiple programs ek saath chala sakta hai.
# Linux CPU scheduling, memory management, file system,
# networking, security aur device management karta hai.


# Q2: Basic Shell Commands, Redirection and Pipes
# ls: files list karta hai
# pwd: current working directory
# > : output redirect (overwrite)
# >>: output redirect (append)
# | : pipe (output of one command as input of another)

ls
pwd
date
whoami

ls > filelist.txt
pwd >> filelist.txt

ls | wc -l
ps -e | grep root


# Q3: Filters and Searching
# head: starting lines
# tail: ending lines
# wc: line, word, character count
# grep: search pattern
# sort + uniq: sorting and removing duplicates

head -5 file.txt
tail -5 file.txt
wc file.txt
grep "unix" file.txt
sort file.txt | uniq


# Q4: VI Editor
# vi file.txt
# i      -> insert mode
# Esc    -> command mode
# :w     -> save
# :q     -> quit
# :wq    -> save and quit
# :q!    -> quit without saving


# Q5(a): Command Line Arguments
# $*  -> sab arguments ek single string me
# "$*" -> same but quoted
# $@  -> arguments alag-alag treat hote hain (recommended)

echo "Using \$*"
cat $*

echo "Using \"\$*\""
cat "$*"

echo "Using literal \$*"
cat '$*'

echo "Using \"\$@\""
cat "$@"


# Q5(b): Roots of Quadratic Equation
# Equation: ax^2 + bx + c = 0
# Discriminant d = b^2 - 4ac
# d > 0  -> real and distinct roots
# d = 0  -> equal roots
# d < 0  -> imaginary roots

echo "Enter a b c:"
read a b c

d=$((b*b - 4*a*c))

if [ $d -gt 0 ]
then
 r1=$(echo "(-$b+sqrt($d))/(2*$a)" | bc -l)
 r2=$(echo "(-$b-sqrt($d))/(2*$a)" | bc -l)
 echo "Roots are real and distinct"
 echo "Root1 = $r1"
 echo "Root2 = $r2"
elif [ $d -eq 0 ]
then
 r=$(echo "-$b/(2*$a)" | bc -l)
 echo "Roots are equal"
 echo "Root = $r"
else
 real=$(echo "-$b/(2*$a)" | bc -l)
 imag=$(echo "sqrt(-$d)/(2*$a)" | bc -l)
 echo "Roots are imaginary"
 echo "$real + i$imag"
 echo "$real - i$imag"
fi


# Q5(c): Integer Arithmetic Operations
# $(( )) integer arithmetic ke liye use hota hai

echo "Enter two numbers:"
read a b

echo "Addition = $((a+b))"
echo "Subtraction = $((a-b))"
echo "Multiplication = $((a*b))"

if [ $b -ne 0 ]
then
 echo "Division = $((a/b))"
 echo "Modulus = $((a%b))"
else
 echo "Division and Modulus not possible"
fi


# Q5(d): Student Details Input and Display
echo "Enter Name:"
read name
echo "Enter Roll:"
read roll
echo "Enter Marks:"
read marks

echo "Name   : $name"
echo "Roll   : $roll"
echo "Marks  : $marks"


# Q5(e): Area, Circumference and Diameter of Circle
# Area = πr²
# Circumference = 2πr
# Diameter = 2r

echo "Enter radius:"
read r

area=$(echo "3.1416*$r*$r" | bc)
circ=$(echo "2*3.1416*$r" | bc)
diameter=$(echo "2*$r" | bc)

echo "Area = $area"
echo "Circumference = $circ"
echo "Diameter = $diameter"


# Q5(f): Temperature Conversion
# Celsius to Fahrenheit and Kelvin

echo "Enter Celsius:"
read c

f=$(echo "($c*9/5)+32" | bc)
k=$(echo "$c+273.15" | bc)

echo "Fahrenheit = $f"
echo "Kelvin = $k"


# Q5(g): Swap Two Numbers
# Method 1: using temporary variable
# Method 2: without temporary variable

echo "Enter a b:"
read a b

temp=$a
a=$b
b=$temp
echo "After swap (using temp): $a $b"

a=$((a+b))
b=$((a-b))
a=$((a-b))
echo "After swap (without temp): $a $b"


# Q5(h): Simple and Compound Interest
# SI = (P*R*T)/100
# CI = P(1+R/100)^T

echo "Enter Principal Rate Time:"
read p r t

si=$(echo "($p*$r*$t)/100" | bc)
ci=$(echo "$p*(1+$r/100)^$t" | bc -l)

echo "Simple Interest = $si"
echo "Compound Interest = $ci"


# Q5(i): Area of Triangle
# Method 1: base-height
# Method 2: Heron's formula

echo "1 Base-Height"
echo "2 Heron's Formula"
read ch

if [ $ch -eq 1 ]
then
 read b h
 echo "Area = $(echo "0.5*$b*$h" | bc)"
else
 read a b c
 s=$(echo "($a+$b+$c)/2" | bc)
 echo "Area = $(echo "sqrt($s*($s-$a)*($s-$b)*($s-$c))" | bc -l)"
fi


# Q5(j): Square, Cube and Higher Power

echo "Enter number:"
read n

echo "Square = $((n*n))"
echo "Cube = $((n*n*n))"
echo "Fourth Power = $((n*n*n*n))"


# Q6(a): Display Lines Between Given Line Numbers

read file s e
sed -n "$s,$e p" $file


# Q6(b): Count Processes and Logged-in Users

echo "Total processes:"
ps -e | wc -l

echo "Logged-in users:"
who | wc -l

who


# Q6(c): Prime Number Check (Optimized)

read n
flag=0

for ((i=2;i*i<=n;i++))
do
 if [ $((n%i)) -eq 0 ]
 then
  flag=1
  break
 fi
done

[ $flag -eq 0 ] && echo "Prime Number" || echo "Not Prime"


# Q6(d): Phonebook Operations
# Phonebook file format: Name PhoneNumber

echo "1 Delete Name"
echo "2 Search Name"
read ch

if [ $ch -eq 1 ]
then
 read name
 grep -v "^$name" phonebook > temp
 mv temp phonebook
 echo "Record deleted"
else
 read name
 grep "^$name" phonebook
fi


# Q6(e): Leap Year Check

read y

if [ $((y%400)) -eq 0 ] || [ $((y%4)) -eq 0 -a $((y%100)) -ne 0 ]
then
 echo "Leap Year"
else
 echo "Not Leap Year"
fi


# Q6(f): Student Grade System

read m

if [ $m -ge 90 ]
then echo "Grade A+"
elif [ $m -ge 80 ]
then echo "Grade A"
elif [ $m -ge 70 ]
then echo "Grade B"
elif [ $m -ge 60 ]
then echo "Grade C"
elif [ $m -ge 40 ]
then echo "Pass"
else echo "Fail"
fi


# Q6(g): String Comparison

read s1 s2

[ "$s1" = "$s2" ] && echo "Strings are equal" || echo "Strings are different"


# Q6(h): Employee Salary Calculation
# HRA = 25%, DA = 15%, TAX = 8%

read bp

hra=$(echo "$bp*0.25" | bc)
da=$(echo "$bp*0.15" | bc)
tax=$(echo "$bp*0.08" | bc)
net=$(echo "$bp+$hra+$da-$tax" | bc)

echo "Basic Pay = $bp"
echo "HRA = $hra"
echo "DA = $da"
echo "TAX = $tax"
echo "Net Salary = $net"


# Q6(i): Compare Two Files and Delete Second if Same

if cmp $1 $2
then
 echo "Files are same, deleting $2"
 rm $2
else
 echo "Files are different"
fi


# Q6(j): Greeting Based on System Time

h=$(date +%H)

if [ $h -lt 12 ]
then echo "Good Morning"
elif [ $h -lt 16 ]
then echo "Good Afternoon"
elif [ $h -lt 20 ]
then echo "Good Evening"
else echo "Good Night"
fi


# Q7(a): Calculator using case

echo "1 Add 2 Sub 3 Mul 4 Div 5 Mod"
read ch a b

case $ch in
1) echo $((a+b));;
2) echo $((a-b));;
3) echo $((a*b));;
4) [ $b -ne 0 ] && echo $((a/b)) || echo "Divide by zero";;
5) echo $((a%b));;
esac


# Q7(b): Area Menu using case

echo "1 Circle 2 Square 3 Rectangle 4 Triangle"
read ch

case $ch in
1) read r; echo "$(echo "3.14*$r*$r" | bc)";;
2) read a; echo $((a*a));;
3) read l b; echo $((l*b));;
4) read b h; echo "$(echo "0.5*$b*$h" | bc)";;
esac


# Q7(c): Linux Commands Menu

echo "1 ls 2 pwd 3 date 4 who 5 cal 6 uptime"
read ch

case $ch in
1) ls;;
2) pwd;;
3) date;;
4) who;;
5) cal;;
6) uptime;;
esac


# Q7(d): Number to Words (0-9)

read d

case $d in
0) echo Zero;;
1) echo One;;
2) echo Two;;
3) echo Three;;
4) echo Four;;
5) echo Five;;
6) echo Six;;
7) echo Seven;;
8) echo Eight;;
9) echo Nine;;
*) echo Invalid;;
esac


# Q7(e): Menu Driven System

echo "1 Files 2 Directory 3 Date 4 User"
read ch

case $ch in
1) ls;;
2) pwd;;
3) date;;
4) whoami;;
esac


# Q7(f): Unit Conversions

echo "1 Dollar to Rupees"
echo "2 Centimeter to Meter"
echo "3 Celsius to Fahrenheit"
echo "4 Kilogram to Gram"
read ch v

case $ch in
1) echo "$(echo "$v*83" | bc)";;
2) echo "$(echo "$v/100" | bc)";;
3) echo "$(echo "($v*9/5)+32" | bc)";;
4) echo "$(echo "$v*1000" | bc)";;
esac


# Q7(g): MCQ Program

echo "Who created Linux?"
echo "1 Linus 2 Bill 3 Steve"
read a

case $a in
1) echo "Correct Answer";;
2|3) echo "Wrong Answer";;
*) echo "Invalid Option";;
esac


# Q7(h): Character Classification

read c

case $c in
[a-z]) echo "Lowercase letter";;
[A-Z]) echo "Uppercase letter";;
[0-9]) echo "Digit";;
*) echo "Special character";;
esac


# Q7(i): Traffic Signal Simulation

read c

case $c in
red) echo "STOP";;
yellow) echo "READY";;
green) echo "GO";;
*) echo "Invalid signal";;
esac


# Q7(j): Train Information System

echo "1 Ranchi-Delhi"
echo "2 Ranchi-Kolkata"
echo "3 Ranchi-Mumbai"
read ch

case $ch in
1)
 echo "Rajdhani Express"
 echo "Garib Rath"
 ;;
2)
 echo "Howrah Express"
 echo "Shatabdi Express"
 ;;
3)
 echo "Duronto Express"
 echo "LTT Express"
 ;;
*)
 echo "No Train Available"
 ;;
esac
