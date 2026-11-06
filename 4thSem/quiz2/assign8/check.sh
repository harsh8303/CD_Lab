#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Usage: $0 filename"
    exit
fi

name=$1

if [ -f "$name" ]
then
    echo "$name is a regular file"

elif [ -d "$name" ]
then
    echo "$name is a directory"

else
    echo "$name is something else or does not exist"
fi
