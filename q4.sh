
read a
day=`echo "$a" | cut -c 3-4 | rev`
month=`echo "$a" | cut -c 1-2 | rev`

nm=$month
upper=`echo "$month" | cut -c 1-1`	
month=`echo "$month" | cut -c 2-2`
echo "$upper"
echo "$month"

if [ $day -eq 0 ]
	then exit 1
	

if [ "$upper" -ge 1 -a "$month" -ge 3 ]
then 
	echo "No Palindrome days available in the given year"
	exit 1
fi

if [ "$month" -eq 8 -o "$month" -eq 9 ]
then io=10
else month=$nm
fi

daycorr=0
monthcorr=0
leap=0
thirty=0
thirtyf=0
feb=0

#LEAP YEAR
if [ $((a%4)) -eq 0 ]
	then 
		if [ $((a%100)) -eq 0 ]
			then 
				if [ $((a%400)) -eq 0 ]
					then
						leap=1
				fi
		else
			leap=1
		fi
fi



#MONTH DAYS
if [ "$month" -eq 2 ]
then
feb=1
monthcorr=1
elif [ "$month" -gt 0 -a "$month" -lt 7 ]
	then
		if [ $((month%2)) -eq 0 ]
			then thirty=1
		else thirtyf=1
		fi
		monthcorr=1
elif [ "$month" -gt 7 -a "$month" -lt 13 ]
	then
		if [ $((month%2)) -eq 1 ]
			then thirty=1
			
		else thirtyf=1
		fi
		monthcorr=1
elif [ "$month" -eq 7 ]
	then
		echo "yes"
		thirtyf=1;
		monthcorr=1;
		
else
	monthcorr=0;
	echo "getting run"
fi


#CHECKING DAYS
if [ "$monthcorr" -eq 1 ]
	then
		if [ "$feb" -eq 1  -a "$leap" -eq 1 ]
			then
				if [ "$day" -lt 30 ]
				then daycorr=1
				else daycorr=0
				fi
		elif [ "$feb" -eq 1 ]
			then
				if [ "$day" -lt 29 ]
				then daycorr=1
				fi
		elif [ "$thirty" -eq 1 ]
			then
				if [ "$day" -lt 31 ]
				then daycorr=1
				fi
		elif [ "$thirtyf" -eq 1 ]
			then 	echo "entered"
				if [ "$day" -lt 32 ]
				then daycorr=1
				fi
		else
			daycorr=0
			echo "getting run"
		fi
fi

echo "$daycorr $monthcorr"

if [ "$daycorr" -eq 1 -a "$monthcorr" -eq 1 ]
then 
	echo "$day-$nm-$a"
else 
	echo "-1"
fi
