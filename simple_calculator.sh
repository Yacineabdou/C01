#!/bin/bash

a=$1
b=$2
op=$3

read a b op

if [ "$op" = "+" ]; then
    resultat=$(($a + $b))
elif [ "$op" = "-" ]; then
    resultat=$(($a - $b))
elif [ "$op" = "*" ]; then
    resultat=$(($a * $b))
elif [ "$op" = "/" ]; then
    resultat=$(($a / $b))
fi
echo "Résultat : $resultat"
exit 0