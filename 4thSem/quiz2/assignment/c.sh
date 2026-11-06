#!/bin/sh
echo "Choose a command to exeute:"
echo "1.list files"
echo "2.present directory"
echo "3.current date:"
echo "4.loggede in user"
read ch
case $ch in
1)
    ls
    ;;
2)
    pwd
    ;;
3)
    date
    ;;
4)
    who
    ;;
*)
    echo "invalid choice"
    ;;
esac

