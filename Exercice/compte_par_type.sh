#!/usr/bin/bash

echo "Nombre de lieux :"
cat Exercice1/ann/*/* | grep Location | wc -l
echo "Nombre d'organisations en :"
cat Exercice1/ann/*/* | grep Organization | wc -l
echo "Nombre de dates :"
cat Exercice1/ann/*/* | grep Date | wc -l
echo "Nombre de sources :"
cat Exercice1/ann/*/* | grep Product | wc -l
echo "Nombre d'heures :"
cat Exercice1/ann/*/* | grep Hour | wc -l
echo "Nombre de personnes :"
cat Exercice1/ann/*/* | grep Person | wc -l
