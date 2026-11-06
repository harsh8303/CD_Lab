#!/bin/bash

echo "Enter a number:"
read n

echo "Multiplication Table of $n"

for ((i=1;i<=10;i++))
do
    result=$((n*i))
    echo "$n x $i = $result"
done
