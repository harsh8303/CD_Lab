#!/bin/sh

while true
do
echo "---------------------------------------"
echo "        SYSTEM MONITORING MENU"
echo "---------------------------------------"
echo "1 → Show running processes sorted by CPU usage"
echo "2 → Show logged-in users"
echo "3 → Show average CPU usage"
echo "4 → Compare users.txt with allowed_users.txt"
echo "5 → Join user details"
echo "6 → Exit"
echo "---------------------------------------"
echo -n "Enter your choice: "
read choice

case $choice in

1)
    echo "Running processes sorted by CPU usage:"
    ps -eo pid,comm,%cpu --sort=-%cpu
    ;;

2)
    echo "Currently logged-in users:"
    who | awk '{print $1}' | sort | uniq | tee users.txt
    echo "Output saved in users.txt"
    ;;

3)
    echo "Calculating average CPU usage..."

    avg=$(ps -eo %cpu --no-headers | awk '
    { total += $1; count++ }
    END { if (count > 0) print total/count; else print 0 }')

    echo "Average CPU Usage: $avg %"
    ;;

4)
    if [ ! -f users.txt ] || [ ! -f allowed_users.txt ]; then
        echo "Required files not found!"
    else
        diff users.txt allowed_users.txt > /dev/null
        if [ $? -eq 0 ]; then
            echo "Users match the allowed list."
        else
            echo "Mismatch: Some logged-in users are not in the allowed list."
        fi
    fi
    ;;

5)
    if [ ! -f users.txt ] || [ ! -f user_details.txt ]; then
        echo "Required files not found!"
    else
        echo "Merged User Details:"
        join users.txt user_details.txt
    fi
    ;;

6)
    echo "Exiting program..."
    break
    ;;

*)
    echo "Invalid choice! Please enter 1-6."
    ;;

esac
done
