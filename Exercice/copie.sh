#!/usr/bin/bash

echo "Nombre de lieux :"
cat * | grep Location | wc -l
echo "Nombre d'organisations :"
cat * | grep Organization | wc -l
echo "Nombre de dates :"
cat * | grep Date | wc -l
echo "Nombre de sources :"
cat * | grep Product | wc -l
echo "Nombre d'heures :"
cat * | grep Hour | wc -l
echo "Nombre de personnes :"
cat * | grep Person | wc -l
