#!/usr/bin/bash

#Pour vérifier que l'utilisateur a bien entré un argument
if [ $# -ne 1 ]
	then
	echo "Ce programme demande un argument."
	exit
fi

#initialisation d'une variable comptant les lignes
compteur=1

#on crée le fichier dans lequel va être stocké notre résultat
>../tableaux/tableau-fr.tsv

while read -r line;
do
	#pour un des lien on a un soucis de redirection, donc on ajoute -L, avec -I on ne récupère que l'entête du site
	# -s pour ne pas avoir la barre de progression, -o /dev/null pour récupérer le contenu de la page dans un fichier qui n'existe pas, donc on ne garde que le -w
	code=$(curl -s -I -L -o /dev/null -w "%{http_code}" "$line")

	#utiliser plusieur curl faisait bloquer wikimedia car trop de requêtes, j'en utilise donc seulement 1 que je met dans une variable contenu
	contenu=$(curl -s -L "$line")

	encodage=$(echo "$contenu"| grep -i 'charset=' | sed 's/.*charset=//I')
	#dans le cas la variable encodage est vide, au lieu de l'afficher tel quel on la remplie par "absence d'encodage"
	if [ -z "$encodage" ]
		then
		encodage="Absence d'encodage"
	fi

	mots=$(echo "$contenu"| wc -w)

	#echo de toutes nos infos
	echo -e "${compteur}" "\t" "$code" "\t" "$encodage" "\t" "$mots" "\t" "${line}" >> ../tableaux/tableau-fr.tsv
	#incrémentation compteur
	compteur=$((compteur + 1))
	#pour éviter de recevoir le code 429 "too many request" j'impose un temps de latence d'une seconde entre les requêtes
	sleep 1
done < "$1";
