#!/bin/sh


echo "1. Dollar to Rupees"
echo "2. Centimeters to Meters"
echo "3. Centigrade to Fahrenheit"

echo "Enter your choice:"
read ch

case $ch in
1)
    echo "Enter dollars:"
    read d
    res=`echo "scale=2; $d * 83" | bc`
    echo "Rupees = $res"
    ;;
2)
    echo "Enter centimeters:"
    read cm
    res=`echo "scale=2; $cm / 100" | bc`
    echo "Meters = $res"
    ;;
3)
    echo "Enter centigrade:"
    read c
    res=`echo "scale=2; ( $c * 9 / 5 ) + 32" | bc`
    echo "Fahrenheit = $res"
    ;;
*)
    echo "Invalid choice"
    ;;
esac
