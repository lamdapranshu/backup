#! /bin/bash



#check_prime(){
#i=2
#p=1
#while [ $1 -gt $i ]
#do 
#if [ $(($1%i)) -eq 0 ]
#then	
#p=1

	

#}


#seive of erastothenes
declare -a arr
i=2
while [ $i -lt $1 ]


if [ ${arr[i]} -ne 1 ]
do
	j=$i
	arr[$i]=0
	while [ $((j*i)) -lt $1 ]
	do
		arr[$((j*i))]=1
		j=$((j+1))
	done
i=$((i+1))
done


x=2
sum=0
while [ $x -lt $(($1-2)) ]
do
if [ ${arr[$x]} -eq 0 && ${arr[$((x+1))]} -eq 0 ]
	echo "(${arr[$x]},${arr[$((x+1))]})"
	product=$((arr[$x]*arr[$((x+1))]))
	temp=0
	
	while [ $product -gt 0 ]
	do
	sum=$sum+$((product%10))
	product=
	done
	
	while [ $temp -gt 0 ]
	
	
	
	
