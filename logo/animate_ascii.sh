#!/bin/bash

counter=0

while :
do
    counter=$((counter+1))
    tput cup 0 0
    tput cuu1
    lolcat $1 -s $counter -f
    sleep .25
done
