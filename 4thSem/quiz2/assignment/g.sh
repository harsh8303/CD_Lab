#!/bin/sh
echo "who is the founder of BITian BITes?"
echo "1.Rohit Kumar Rajak"
echo "2.Mohit kumar Lodwal"
echo "3.Nilesh Seth"
echo "4.Baba Ramdev"
read ch
case $ch in
1)
    echo "you are right, Rohit Kumar Rajak is the founder and developer of BITian BItes."
    ;;
2)
    echo "you are wrong, Mohit Kumar Lodwal is the Co-Founder od BITian BITes."
    ;;
3)
    echo "you are totally wrong."
    ;;
4)
    echo "haha! it's absolutely Wrong,BKL."
    ;;
*)
    echo "choose correct option."
    ;;
esac
