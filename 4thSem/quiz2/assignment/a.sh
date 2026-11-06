#!/bin/sh
echo "Enter first number"
read a
echo "Enter second number"
read b
echo "Select operations:"
echo "1.addition"
echo "2.subtration"
echo "3.multiplication"
echo "4.division"
read ch

case $ch in
1)
    res=` expr $a + $b `
    echo "addition is = $res"
    ;;
2)
    res=` expr $a - $b `
    echo "subtraction is = $res"
    ;;
3)
    res=` expr $a \ * $b `
    echo "multiplication is = $res"
    ;;
4)
    res=`echo "scale=2; $a / $b" | bc`
    echo "division is = $res"
    ;;
*)
    echo "invalid "
    ;;
esac
