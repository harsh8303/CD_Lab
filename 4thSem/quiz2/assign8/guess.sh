#!/bin/bash

answer=$$
count=0

echo "Guess the number!"

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
