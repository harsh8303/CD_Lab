echo "Enter a number"
read n
flag=0
if [ $n -le 1 ]
then
	echo "$n is not a prime"
	exit
fi

for ((i=2; i*i<=n;i++))
do
	if [ $((n%i)) -eq 0 ]
	then
		flag=1
		break
	fi
done
if [ $flag -eq 0]
then
	echo " $n is a prime number"
else
	echo " $n is not a prime number"
fi
