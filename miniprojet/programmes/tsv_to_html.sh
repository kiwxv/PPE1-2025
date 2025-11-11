#!/usr/bin/bash

#Pour vérifier que l'utilisateur a bien entré les arguments
if [ $# -ne 2 ]
	then
	echo "Ce programme demande deux arguments."
	exit
fi


SORTIE=$2

#on crée le fichier dans lequel va être stocké notre résultat
>$2


{
echo "<html>"
echo "  <head>"
echo "          <meta charset="UTF-8" />"
echo "  </head>"
echo "  <body>"
echo "      <table>"


#on précise que les colonnes sont marquées par des tabulation avec IFS=$"\t"
while IFS=$'\t' read -r -a colonne;
do
    echo "          <tr>"
    for col in "${colonne[@]}";
    do
      echo "                <td>${col}</td>"
    done
    echo "          </tr>"
done < "$1";
echo "      </table>"
echo "  </body>"
echo "</html>"
} >"$SORTIE"
