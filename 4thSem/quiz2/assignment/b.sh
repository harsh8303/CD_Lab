#!/bin/sh

echo "Enter shape to find its area"
echo "1. Circle"
echo "2. Square"
echo "3. Rectangle"
echo "4. Triangle"

read ch

case $ch in
1)
    echo "Enter radius"
    read r
    res=$(echo "scale=2; 3.14 * $r * $r" | bc)
    echo "Area of circle is: $res"
    ;;
2)
    echo "Enter side"
    read a
    res=$(echo "scale=2; $a * $a" | bc)
    echo "Area of square is: $res"
    ;;
3)
    echo "Enter length"
    read l
    echo "Enter breadth"
    read b
    res=$(echo "scale=2; $l * $b" | bc)
    echo "Area of rectangle is: $res"
    ;;
4)
    echo "Enter base"
    read b
    echo "Enter height"
    read h
    res=$(echo "scale=2; 0.5 * $b * $h" | bc)
    echo "Area of triangle is: $res"
    ;;
*)
    echo "Invalid choice"
    ;;
esac

