#!/bin/bash

echo "Enter a number:"
read num

temp=$num
sum=0

while [ $num -gt 0 ]
do
    digit=$((num % 10))
    cube=$((digit*digit*digit))
    sum=$((sum + cube))
    num=$((num / 10))
done

if [ $sum -eq $temp ]
then
    echo "$temp is an Armstrong number"
else
    echo "$temp is not an Armstrong number"
fi
