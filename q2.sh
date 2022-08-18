#! /bin/bash

#defining some ranges for charachters
#------------------------------------

#lower case
declare -a lower_c
lower_c[0]=97
lower_c[1]=26

#upper case
declare -a upper_c
upper_c[0]=65
upper_c[1]=26

#symbols
declare -a spec_c
spec_c=("@" "#" "$" "%" "^" "&" "*" "?" "~")
len_c=8

#numbers 
declare -a numeri_c
numeri_c[0]=48
numeri_c[1]=10
#--------------------------------------


#loop
condi=1
while [ $condi -eq 1 ]
do
#selecting a length for password
len=$(echo $[ $RANDOM % 15 + 6 ])


string=""

#selection conditions

upper_sel=1
lower_sel=1
symbol_sel=1
number_sel=1

#Adding first char
sel1=$[ $RANDOM % 2 + 1 ]
if [ $sel1 -eq 1 ]
then
	sel2=$[ $RANDOM % ${lower_c[1]} + ${lower_c[0]} ]
	alpha=$(printf "\x$(printf %x $sel2)")
	string="$string$alpha"
	number_sel=0
	lower_sel=0
	
else
	sel2=$[ $RANDOM % ${upper_c[1]} + ${upper_c[0]} ]
	alpha=$(printf "\x$(printf %x $sel2)")
	string="$string$alpha"
	
fi

#making the password
i=1
while [ $len -gt $i ]
do
	
	#condition for last charachter
	if [ $i -eq $((len-1)) ]
	then	upper_sel=0
	fi
	
	#selecting an set of charchters
	declare -a arr_sel
	j=0
	if [ $upper_sel -eq 1 ]
	then	arr_sel[$j]=2
		j=$((j+1))
	fi
	
	if [ $lower_sel -eq 1 ]
	then	arr_sel[$j]=1
		j=$((j+1))
	fi
	
	if [ $symbol_sel -eq 1 ]
	then	arr_sel[$j]=3
		j=$((j+1))
	fi
	
	if [ $number_sel -eq 1 ]
	then	arr_sel[$j]=4
		j=$((j+1))
	fi
	#len=${#arr_sel[@]}
	#len=$((len-1))
	sel3=$[ $RANDOM % $j + 0 ]
	
	
	#selecting a set charachter from that set	
	if [ ${arr_sel[$sel3]} -eq 1 ]
	then	sel2=$[ $RANDOM % ${lower_c[1]} + ${lower_c[0]} ]
		#echo 1
		#echo $sel2
		alpha=$(printf "\x$(printf %x $sel2)")
		string="$string$alpha"
		number_sel=0
		lower_sel=0
		upper_sel=1
		symbol_sel=1
		
	elif
	  [ ${arr_sel[$sel3]}  -eq 2 ]
	then	sel2=$[ $RANDOM % ${upper_c[1]} + ${upper_c[0]} ]
		#echo 2
		#echo $sel2
		alpha=$(printf "\x$(printf %x $sel2)")
		string="$string$alpha"
		lower_sel=1
		symbol_sel=1
		number_sel=1
		upper_sel=1

	elif
	   [ ${arr_sel[$sel3]} -eq 4 ]
	then	sel2=$[ $RANDOM % ${numeri_c[1]} + ${numeri_c[0]} ]
		#echo 4
		#echo $sel2
		alpha=$(printf "\x$(printf %x $sel2)")
		string="$string$alpha"
		lower_sel=0
		symbol_sel=1
		number_sel=1
		upper_sel=1		
		
	elif
	   [ ${arr_sel[$sel3]} -eq 3 ]
	then    sel2=$[ $RANDOM % 8 + 0 ]
		#echo 3
		#echo $sel2
		alpha=${spec_c[$sel2]}
		string="$string$alpha"
		lower_sel=1
		symbol_sel=0
		number_sel=1
		upper_sel=1
	fi
	i=$((i+1))
done

#checking final conditions
#------------------------


#uppper lower number digits
if [[ "$string" =~ [[:lower:]] && "$string" =~ [[:upper:]] && "$string" =~ ['@#$%^&*?~'] && "$string" =~ [[:digit:]]  ]]
then
	echo $string
	condi=0
else
	condi=1
fi


done


	
	
	
	
	
			





 
