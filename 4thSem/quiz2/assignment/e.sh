#!/bin/sh


echo "1. List all files"
echo "2. Current working directory"
echo "3. Calendar"
echo "4. Vi editor"
echo "5. Today's date"
echo "6. Current user"

echo "Enter your choice:"
read ch

case $ch in
1)
    ls
    ;;
2)
    pwd
    ;;
3)
    cal
    ;;
4)
    vi
    ;;
5)
    date
    ;;
6)
    whoami
    ;;
*)
    echo "Invalid choice"
    ;;
esac
