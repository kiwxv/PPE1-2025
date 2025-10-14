#!/usr/bin/bash

echo "Nombre de location en 2016 :"
cat Exercice1/ann/2016/* | grep Location | wc -l
echo "Nombre de location en 2017 :"
cat Exercice1/ann/2017/* | grep Location | wc -l
echo "Nombre de location en 2018 :"             
cat Exercice1/ann/2018/* | grep Location | wc -l
