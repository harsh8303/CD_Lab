#!/bin/bash

# Input data
process=(p1 p2 p3 p4)
arrival=(0 1 2 3)
burst=(5 3 8 6)

n=4


wt[0]=0
tat[0]=${burst[0]}


for ((i=1; i<n; i++))
do
    wt[$i]=$(( ${wt[i-1]} + ${burst[i-1]} ))
done


for ((i=0; i<n; i++))
do
    tat[$i]=$(( ${wt[i]} + ${burst[i]} ))
done


echo "Process AT BT WT TAT"
for ((i=0; i<n; i++))
do
    echo "${process[i]} ${arrival[i]} ${burst[i]} ${wt[i]} ${tat[i]}"
done


sum_wt=0
sum_tat=0

for ((i=0; i<n; i++))
do
    sum_wt=$((sum_wt + wt[i]))
    sum_tat=$((sum_tat + tat[i]))
done

avg_wt=$((sum_wt / n))
avg_tat=$((sum_tat / n))

echo "Average Waiting Time = $avg_wt"
echo "Average Turnaround Time = $avg_tat"
