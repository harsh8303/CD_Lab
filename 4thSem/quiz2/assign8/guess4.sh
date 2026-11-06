#!/bin/bash

answer=`expr $$ % 100`
count=0

echo "Guess the number between 0 and 99"

while true
do
    echo "Enter your guess:"
    read guess

    count=$((count+1))

    if [ $guess -eq $answer ]
    then
        echo "Correct! You guessed it in $count attempts."
        break

    elif [ $guess -gt $answer ]
    then
        echo "Too high!"

    else
        echo "Too low!"
    fi
done
