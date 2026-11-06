#!/bin/bash

while true
do
echo "------ MENU ------"
echo "1. Copy a file"
echo "2. Rename a file"
echo "3. Delete a file"
echo "4. Compare two files"
echo "5. Count characters in a file"
echo "6. Change file permission"
echo "7. Exit"

echo "Enter your choice:"
read ch

case $ch in

1)
echo "Enter source file:"
read f1
echo "Enter destination file:"
read f2
cp $f1 $f2
;;

2)
echo "Enter old filename:"
read f1
echo "Enter new filename:"
read f2
mv $f1 $f2
;;

3)
echo "Enter filename to delete:"
read f1
rm $f1
;;

4)
echo "Enter first file:"
read f1
echo "Enter second file:"
read f2
cmp $f1 $f2
;;

5)
echo "Enter filename:"
read f1
wc -c $f1
;;

6)
echo "Enter filename:"
read f1
echo "Enter permission (example 755):"
read perm
chmod $perm $f1
;;

7)
echo "Exiting..."
exit
;;

*)
echo "Invalid choice"
;;

esac

done
