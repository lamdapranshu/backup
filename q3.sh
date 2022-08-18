#! /bin/bash

read input



declare -a arr

num=$input

echo -n "$input" 
while [ "$num" -ne 6174 ]
do
i=0
n=3

	
	arr[0]=`echo "$num" | cut -c 1-1`
	arr[1]=`echo "$num" | cut -c 2-2`
	arr[2]=`echo "$num" | cut -c 3-3`
	arr[3]=`echo "$num" | cut -c 4-4`
	
	

	readarray -td '' b < <(printf '%d\0' "${arr[@]}" | sort -z)
	num1=""
	num2=""
	k=0
	j=$n
	while [ "$k" -le $((n)) ]
	do
	num1="$num1${b[$k]}"
	num2="$num2${b[$j]}"
	k=$((k+1))
	j=$((j-1))
	done
	final=$(expr $num2 - $num1)
	while [ "${#final}" -lt 4 ]
	do
	final="0$final"
	done
	echo -n ", $final"
num=$final
done
