#!/usr/bin/bash

#Pour vérifier que l'utilisateur a bien entré un argument
if [ $# -ne 2 ]
	then
	echo "Ce programme demande deux arguments."
	exit
fi

#initialisation d'une variable comptant les lignes
compteur=1

SORTIE=$2

#on crée le fichier dans lequel va être stocké notre résultat
>$2

#on crée une variable qui va stocker nos données extraites dans un tableau pour les traiter ensuite
TSV+=$'Ligne\tCode_HTTP\tEncodage\tMots\tURL\n'

echo "Traitement des urls..."
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

	#on ajoute nos infos dans la varibale TSV
	TSV+="${compteur}"$'\t'"${code}"$'\t'"${encodage}"$'\t'"${mots}"$'\t'"${line}"$'\n'

	echo "Url $compteur traité"
	#incrémentation compteur
	compteur=$((compteur + 1))
	#pour éviter de recevoir le code 429 "too many request" j'impose un temps de latence d'une seconde entre les requêtes
	sleep 1
done < "$1";

echo "Création du fichier html..."
{
echo "<html>"
echo "  <head>"
echo "          <meta charset="UTF-8" />"
echo "  </head>"
echo "  <body>"
echo "      <table>"


#on précise que les colonnes sont marquées par des tabulation avec IFS=$"\t"
echo "$TSV" | while IFS=$'\t' read -r -a colonne;
do
    echo "          <tr>"
    for col in "${colonne[@]}";
    do
      echo "                <td>${col}</td>"
    done
    echo "          </tr>"
done
echo "      </table>"
echo "  </body>"
echo "</html>"
} >"$SORTIE"

echo "Fichier crée à : $2"
