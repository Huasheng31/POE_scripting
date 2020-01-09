#!/bin/sh
afficheMenu () {
	echo "Bienvenue dans votre agenda téléphonique, faites votre choix :"
	echo ""
	echo "Tapez:"
	echo "> 1 < Pour ajouter une nouvelle fiche."
	echo "> 2 < Rechercher une fiche."
	echo "> 3 < Détruire une fiche"
	echo "> 4 < Modifier une fiche."
	echo "> 5 < Lister l'annuaire."
	echo "> q < Pour quitter."
}

saisie () {
	read -p "Votre choix: " input1
}

pause() { 
	echo "Enter pour continuer"
	read empty
}

create () {
	echo "### Création ###"
	echo "Vous allez créer une nouvelle fiche"
	echo -n "Entrez un nom : " ; read nomCreate
	echo -n "Entrez un numéro de tel " ; read telCreate
	echo "merci"
	echo "$nomCreate,$telCreate" >> ~/agenda.txt
}

readI () {
	echo "### Recherche ###"
	echo "Tapez votre recherche"
	echo -n ">" ; read inputread
	grep -n $inputread ~/agenda.txt 
}

update () {
	echo "### Modification ###"
	echo -n "Votre choix : " ; read input3    
    if grep "^$input3," ~/agenda.txt; then
        grep -v "$input3" ~/agenda.txt > ~/buffer
        mv ~/buffer ~/agenda.txt
        echo "Nouveau nom ?"
        read nom
        echo "Nouveau telephone ?"
        read tel
        echo "$nom,$tel" >> ~/agenda.txt
        echo "La fiche $input3 a bien été modifiée"
    else
    	echo "L'utilisateur n'existe pas"
    fi
}

destroy () {
echo "### Destruction ###"
echo "Entrez le nom de la fiche à détruire:"
read nom
grep -v "$nom" ~/agenda.txt > ~/buffer
mv ~/buffer ~/agenda.txt
}

list () {
	echo "### Liste ###"
	echo "Tapez "q" pour quitter."
	pause
	less ~/agenda.txt
}

quitter () {
	echo "################"
	echo "Vous avez quitté"
	exit
}

####################################
check=0
while [ check=0 ]; do
	afficheMenu
	saisie
	case "$input1" in
		1)
			create;;
		2)
			readI;;
		3)
			destroy;;
		4)
			update;;
		5)
			list;;
		q)
			quitter;;
		*)
			echo "###############"
			echo "Mauvaise entrée"
	esac
	check=1
done