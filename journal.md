# Journal de bord du projet encadré

## Exo pour 8/10 
Pour voir que le projet n'est plus à jour j'essaie "git status" mais elle me donne la même information que précédemment, tout est à jour. Par contre avec "ls" je peux voir qu'il n'y a qu'un fichier dans le dossier, il n'est donc pas à jour. Je le mets à jour avec "git pull" Une fois modifié depuis le fichier hors git j'utilise "git status" pour vérifier si la modification a bien été prise en compte mais le terminal me répond que tout est à jour. Grâce à `git add .` les changements sont pris en compte. Ensuite j'utilise `git commit -m` puis `git push`, mais la version qui est mise à jour sur git hub n'est pas la dernière, donc je réessaie en décomposant au maximum les étapes. C'est tiptop ça marche. Enfin je crée le tag avec `git tag gitinto -m` puis je le mets à jour sur le github avec `git push origin gitinto`.

## Exo pour 15/10
J'ai push le tag de l'exercice 1 fait en cours. Pour l'exercice 2 j'ai crée un script qui allait chercher un par un chaque type d'annotation dans le dossier 2016. Pour la deuxième partie ce script ne me semblait pas exploitable, j'ai donc crée un deuxième script qui part du principe qu'il est exécuté directement dans le bon dossier (il ne va donc pas chercher cat `Exercice1/ann/2016` mais directment * pour prendre tous les fichiers de son dossier). Je nomme ce deuxième script "copie". Ensuite je crée le script principal compte_par_type_par_an.sh qui va lui même se rendre dans les bons dossiers avec un cd avant d'exécuter le script copie. Ce script permet de se déplacer dans les 3 fichiers 2016-2017-2018 et d'y éxécuter à chaque fois la même recherche. Ensuite je sépare les résultats avec 3 echo pour essayer de rendre ça plus lisible.

## Mini-projet
### Questions :

1. Pourquoi ne pas utiliser cat ?
Utiliser `while read -r line` permet de tokeniser le texte en mot alors que `cat` prendrait seulement le texte dans son entièreté

2. Comment transformer "urls/fr.txt" en paramètre du script ?
Pour transformer "urls/fr.txt" en paramètre de script on le remplace par $1.
    2.1 Valider l’argument : ajouter le code nécessaire pour s’assurer qu’on donne bien un argument au script, sinon on s’arrête

3. Comment afficher le numéro de ligne avant chaque URL (sur la même ligne) ?
• Bien séparer les valeurs par des tabulations
Pour afficher le numéro de ligne avant chaque URL j'initialise une variable "ligne" à laquelle j'ajoute 1 pour chaque boucle. Je rajoute cette boucle et la tabulation dans le echo

## Mini-projet 2
Pour créer mon fichier html j'ai décidé de ne pas ajouter de ligne header qui donne des information sur ce que contiennent les colonnes, puisqu'il n'y en avait pas dans mon fichier initial. Si besoin j'ajouterai cette ligne dans le futur. J'ai aussi décidé de créer un nouveau script qui transforme le tsv en html, mais au besoin je pourrai aussi créer un script qui effectue directement ces deux scripts sur le même fichier pour ne pas avoir à lancer manuellement les deux scripts à chaque fois.

## Mini-projet 3
J'ai réuni les 2 scripts en un seul pour éviter d'avoir à faire deux exécutions à chaque fois. J'ai aussi rajouté des échos qui expliquent à quel étape le traitement en est, sinon c'est vide en attendant.
J'ai rajouté du style bulma sur mon code html, je ne sais pas s'il fallait le rajouter directement dans le script aussi.
