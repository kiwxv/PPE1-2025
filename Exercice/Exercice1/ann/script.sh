#!/usr/bin/bash

echo "Nombre de location en 2016 :"
cat 2016/* | grep Location | wc -l
echo "Nombre de location en 2017 :"
cat 2017/* | grep Location | wc -l
echo "Nombre de location en 2018 :"             
cat 2018/* | grep Location | wc -l             
