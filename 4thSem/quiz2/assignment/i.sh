#!/bin/sh

echo "Enter traffic signal color:"
echo "1. Red"
echo "2. Yellow"
echo "3. Green"

read ch

case $ch in
1)
    echo "STOP"
    ;;
2)
    echo "READY"
    ;;
3)
    echo "GO"
    ;;
*)
    echo "Invalid signal"
    ;;
esac
