#!/bin/bash

echo "Enter a string:"
read str

count=0

for ((i=0;i<${#str};i++))
do
    char=${str:$i:1}

    if [[ "$char" == "a" || "$char" == "e" || "$char" == "i" || "$char" == "o" || "$char" == "u" || "$char" == "A" || "$char" == "E" || "$char" == "I" || "$char" == "O" || "$char" == "U" ]]
    then
        count=$((count+1))
    fi
done

echo "Number of vowels = $count"
