#!/bin/bash

echo "Enter a number:"
read num

min=9

while [ $num -gt 0 ]
do
    digit=$((num % 10))

    if [ $digit -lt $min ]
    then
        min=$digit
    fi

    num=$((num / 10))
done

echo "Smallest digit is $min"
