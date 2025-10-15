#!/usr/bin/bash

if [ $# -ne 4 ]
then
    echo "nombre d'argument incorrect"
    exit
fi

DATADIR=$1
ANNEE=$2
MOIS=$3
TOPN=$4

if [ ! -d $DATADIR ]
then
    echo "$DATADIR n'est pas un dossier"
    exit
fi

if [ ! -d $DATADIR/2016 ] || [ ! -d $DATADIR/2017 ] || [ ! -d $DATADIR/2018 ]
then
    echo "$DATADIR n'est probabliement pas le bon dossier"
    exit
fi

cd $DATADIR

cat ./${ANNEE}/${ANNEE}_${MOIS}*.ann | grep Location | cut -f3 | sort | uniq -c | sort -n | tail -n $TOPN

