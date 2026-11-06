#!/bin/bash

arr=(2 5 8 7 4)

even_sum=0
odd_sum=0

for num in "${arr[@]}"
do
    if [ $((num % 2)) -eq 0 ]
    then
        even_sum=$((even_sum + num))
    else
        odd_sum=$((odd_sum + num))
    fi
done

echo "Sum of even numbers = $even_sum"
echo "Sum of odd numbers = $odd_sum"
