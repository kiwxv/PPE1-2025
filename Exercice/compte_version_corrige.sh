#!/usr/bin/bash

$CHEMIN = $1
$TYPE = $2
cat "$CHEMIN/*/* | grep "$TYPE" | wc -l
