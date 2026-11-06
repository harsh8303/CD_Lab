#!/bin/sh
echo "Enter any character to check whether it's lowercase , uppercase etc."
read ch
case $ch in
[A-Z])
    echo " uppercase "
    ;;
[a-z])
    echo "lowercase "
    ;;
[0-9])
    echo " numbers "
    ;;
*)
    echo " other "
    ;;
esac

