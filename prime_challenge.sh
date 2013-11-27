#!/bin/bash

validate_arg () {
	[[ $1 =~ ^[0-9]+$ ]]
}

#Set variable for N primes if an argument is passed
if [ -n "$1" ]
then
	echo "Validating if argument is integer."
	
	if validate_arg "$1"
	then
		echo "Setting 'N' to $1 ."
		n_primes="$1"
	else
		echo "Invalid argument.. using 10 as 'N'."
		n_primes=10
	fi
else 
	echo "Setting 'N' to 10."
	n_primes=10
fi

i=0
primes=(" ")

while [ ${#primes[@]} -lt $n_primes ]
do
	let i=$i+1
	
	case $i in
		1)
			continue;;
		[2,3,5,7] | 11 | 13)
			primes+=($i);;
		*)
			if [ $(($i % 2)) -gt 0 ] && [ $(($i % 3)) -gt 0 ] && [ $(($i % 5)) -gt 0 ] && [ $(($i % 7)) -gt 0 ] && [ $(($i % 11)) -gt 0 ] && [ $(($i % 13)) -gt 0 ] 
			then
				primes+=($i)
			fi
			;;
	esac
done

#Table Formatting
line="================"

printf "\n%s\n%s\n%s\n" "$line" "Prime Challenge Table" "$line"

for i in "${primes[@]}"
do
	printf "%s\t" "$i"
done

for i in "${primes[@]}"
do
	if [[ "$i" -ne " " ]]
	then
		printf "\n%s" "$i"
		
		for x in "${primes[@]}"
		do
			if [[ "$x" -ne " " ]]
			then
				printf "\t%s" "$(($i*$x))"
			fi
		done
	fi 
done

printf "\n"
