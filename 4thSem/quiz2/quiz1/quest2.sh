#!/bin/sh
echo "Enter your choice"
echo "1.show running processes sorted by cpu usage"
echo "2.show logged in users"
echo "3.show average cpu usage"
echo "4.compare users.txt with allowed_users.txt"
echo "5.join user details"
echo "6.exit"

echo "Enter you options"
read ch

case $ch in
1)
	echo "ps -eo pid,comm,%cpu --sort=-%cpu"
	;;
2)
	who | sort | uniq | tee users.txt
	;;
3)
	avg=$(ps -eo %cpu --no-headers | awk '
        { total += $1; count++ }
        END { if (count > 0) print total/count; else print 0 }')

        echo "Average CPU Usage: $avg %"
	;;
6)
	exit
	;;
esac
