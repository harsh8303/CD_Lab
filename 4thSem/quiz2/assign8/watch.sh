#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Usage: $0 username"
    exit
fi

user=$1

echo "Waiting for $user to login..."

while true
do
    who | grep "$user" > /dev/null

    if [ $? -eq 0 ]
    then
        tty=$(who | grep "$user" | awk '{print $2}')

        echo "Hello $user! Welcome to the system." > /dev/$tty
        echo "$user has logged in."

        break
    fi

    sleep 10
done
