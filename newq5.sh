#! /bin/bash


touch newfile1.txt
touch newfile2.txt
touch temp.txt
#echo $1
echo "2" >> newfile1.txt
echo "1" >> newfile2.txt

input=$1
input=$((input-1))
#echo $input
while [ $input -gt 0 ]
do

echo "$(cat newfile1.txt)+$(cat newfile2.txt)" | bc > temp.txt
cat newfile2.txt>newfile1.txt
cat temp.txt>newfile2.txt
input=$((input-1))

#echo "yes"
done
cat newfile2.txt
#cat newfile1.txt
rm newfile1.txt
rm newfile2.txt
rm temp.txt


