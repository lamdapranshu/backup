#! /bin/bash
a=1
f(){
$1=$(($1+1))
echo "$1"
}

a=$(f a)
echo "$a"


