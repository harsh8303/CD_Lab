#!/bin/bash

echo "Enter value of N:"
read n

sum=0

for ((i=1;i<=n;i++))
do
    cube=$((i*i*i))
    sum=$((sum + cube))
done

echo "Sum of cubes from 1 to $n is $sum"
