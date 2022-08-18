#! /bin/bash

input=$1
input=$((input-2))
arr1[0]=2
arr2[0]=1
echo $input
declare -a temp1
declare -a temp2

while [ $input -gt 0 ]
do
	length1=${#arr1[@]}
	length1=$((length1-1))
	length2=${#arr2[@]}
	length2=$((length2-1))
	echo $length1
	echo $length2
	
	#common length
	length=0
	
	if [ $length1 -gt $length2 ]
		then length=$length1
	else length=$length2
	fi
	
	#revering the first array
	i=0
	while [ $i -le $length1 ]
	do
	temp1[i]=${arr1[$((length1-i))]}
	i=$((i+1))
	done
	echo ${temp1[@]}
	echo ${arr2[@]}
	
	#revering the second array
	j=0
	while [ $j -le $length2 ]
	do
	temp2[i]=${arr2[$((length2-j))]}
	j=$((j+1))
	done
	echo ${temp2[@]}
	#appending additional zeros if required
	if [ $length1 -ne $length2 ]
		then if [ $length1 -gt $length2 ]
			then	temp2[$((length2+1))]=0
			else 
				temp2[$((length1+1))]=0
			fi
	fi
	
			
	
	#calculating sum
	declare -a sum
	s=0
	y=0
	c=0
	while [ $length -ge $y ]
	do 
	
	echo ${temp1[0]}
	echo ${temp2[0]}
	s=$((temp1[y]+temp2[y]+c))
	if [ $s -ge 10 ]
		then c=1
			s=$((s%10))
			sum[$i]=$s
			echo $s
	fi
	echo $s
	y=$((y+1))
	done
	#checking overflow
	if [ $c -eq 1 ]
		then	sum[$((length+1))]=1
		length=$((length+1))
	fi
	
	#copying stuff
	arr1=(${arr2[@]})
	
	
	#reversing the ans
	x=0
	while [ $x -le $length ]
	do
	arr2[$x]=${temp[$((length-x))]}
	done
	
input=$((input-1))
done
echo ${arr2[@]}
	
	
	
