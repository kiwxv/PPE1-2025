#!/usr/bin/bash

nombre=2016
while nombre<2018
do
    echo "Nombre de location en $nombre :"
    cat Exercice1/ann/$nombre/* | grep Location | wc -l
    nombre+=1
done


