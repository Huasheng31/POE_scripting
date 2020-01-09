#!/bin/sh

checkNum () {
	[ $1 -eq 0 ] 2> /dev/null
	res=$?
	[ $2 -eq 0 ] 2> /dev/null
	res2=$?
	if [ $res -le 1 ] && [ $res2 -le 1 ]; then
		okNum=0
	else
		okNum=1
	fi
}

checkSign (){
	if [ $1 = "+" ]; then
		okSign=1
	elif [ $1 = "-" ]; then
		okSign=2
	elif [ $1 = "/" ]; then
		okSign=3
	elif [ $1 = "x" ]; then
		okSign=4
	else
		okSign=5
	fi
}

calcul () {
	if [ $okNum -eq 1 ] && [ $okSign -eq 5 ]; then #erreur les deux
		echo "Merci de rentrer des nombres et des opérateurs corrects"

	elif [ $okNum -eq 1 ]; then #erreur les chiffres
		echo "Merci de rentrer des nombres"
		
	elif [ $okSign -eq 5 ]; then #erreur les chiffres
		echo "Merci de rentrer des opérateurs corrects"

	elif [ $okNum -eq 0 ] && [ $okSign -eq 1 ]; then #addition
		add=$(expr $1 + $3 2>/dev/null)
		echo "$1 + $3 = $add"

	elif [ $okNum -eq 0 ] && [ $okSign -eq 2 ]; then #soustraction
		sous=$(expr $1 - $3 2>/dev/null)
		echo "$1 - $3 = $sous"

	elif [ $okNum -eq 0 ] && [ $okSign -eq 3 ]; then #division
		div=$(expr $1 / $3 2>/dev/null)
		echo "$1 / $3 = $div"

	elif [ $okNum -eq 0 ] && [ $okSign -eq 4 ]; then #multiplication
		mult=$(expr $1 \* $3 2>/dev/null)
		echo "$1 x $3 = $mult"
	
	else
		echo "erreur"
	fi
}
########################################
checkNum $1 $3
checkSign $2
calcul $1 $2 $3

