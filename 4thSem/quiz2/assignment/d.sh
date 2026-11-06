#!/bin/sh
echo "ENter number between 1 to 5"
read ch
case $ch in
1)
    echo"one"
    ;;
2)
    echo "two"
    ;;
3)
    echo "three"
    ;;
4)
    echo "four"
    ;;
5)
    echo "five"
    ;;
*)
    echo "invalid"
    ;;
esac

