#!/bin/bash

miles=$1
option=$2

if [ -z "$miles" ]
then
    echo "Usage: $0 miles [-y | -r]"
    exit
fi

if [ "$option" = "-y" ]
then
    result=$((miles*1760))
    echo "$miles miles = $result yards"

elif [ "$option" = "-r" ]
then
    result=$((miles*320))
    echo "$miles miles = $result rods"

else
    result=$((miles*5280))
    echo "$miles miles = $result feet"
fi
