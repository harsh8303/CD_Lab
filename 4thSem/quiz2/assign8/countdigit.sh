#!/bin/bash

echo "Enter a number:"
read num

count=0

while [ $num -gt 0 ]
do
    num=$((num / 10))
    count=$((count + 1))
done

echo "Number of digits = $count"
