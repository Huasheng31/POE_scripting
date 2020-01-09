#!/bin/sh

echo "Bonjour, tape une note entre 0 et 20 s'il te plait"

check=0
while check=0; do
read input

if [ $input -ge 16 ] && [ $input -le 20 ]; then
	echo "ta note est : $input, TB !"
	break
elif [ $input -ge 14 ] && [ $input -le 15 ]; then
	echo "ta note est : $input, B !"
	break
elif [ $input -ge 12 ] && [ $input -le 13 ]; then
	echo "ta note est : $input, AB !"
	break
elif [ $input -ge 10 ] && [ $input -le 11 ]; then
	echo "ta note est : $input, M !"
	break
elif [ $input -ge 0 ] && [ $input -le 9 ]; then
	echo "ta note est : $input, I !"
	break
else 
	echo "Tu as rentré $input ! Rentre un chiffre entre 0 et 20"
	check=1
fi
done