#!/bin/sh
afficheMenu () {
	#clear
	#echo "\n"
	echo "Bienvenue cher utilisateur, faites votre choix :"
	echo ""
	echo "Tapez:"
	echo "> 1 < Vérifier l’existence d’un utilisateur"
	echo "> 2 < Connaitre l’UID d’un utilisateur"
	echo "> q < Pour quitter"
	echo ""
}
pause() { 
	echo "Enter pour continuer"
	read empty
}
saisie () {
	echo -n "Votre choix : " ; read user
}
verifier () {
	id $user > /dev/null 2>/dev/null
	if [ $? -eq 0 ]; then
		#echo "\n"
		echo "###############################"
		echo "L'utilisateur $user existe bien"
		echo "\n"
	else
		#echo "\n"
		echo "######################"
		echo "Utilisateur inexistant"
		echo "\n"
	fi
	#pause
}
readUID () {
	var=$(id -u $user 2>/dev/null)
	if [ $? -eq 0 ]; then
		#echo "\n"
		echo "###############################"
		echo "L'utilisateur $user existe."
		echo "Voici son UID: $var"
		#echo "\n"
	else
		#echo "\n"
		echo "######################"
		echo "Utilisateur inexistant"
		#echo "\n"
	fi
	#pause
}
quitter () {
	#echo "\n"
	echo "################"
	echo "Vous avez quitté"
	exit
}
#####################################
check=0
while [ check=0 ]; do
	afficheMenu
	saisie
	case "$user" in
	1)
		saisie
		verifier;;
	2)
		saisie
		readUID;;
	q)
		quitter;;
	*)
		#echo "\n"
		echo "#####################"
		echo "Entrez soit 1, 2 ou q"
		#pause
	esac
	check=1
done