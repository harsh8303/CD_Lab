#!/bin/bash

echo "Enter a line of text:"
read line

count=0

for ((i=0;i<${#line};i++))
do
    char=${line:$i:1}

    if [ "$char" = " " ]
    then
        count=$((count+1))
    fi
done

echo "Number of blank spaces = $count"
