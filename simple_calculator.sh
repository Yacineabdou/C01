#!/bin/bash

a=$1
b=$2
op=$3

read a b op

if [ "$op" = "+" ]; then
    Resultat=$(($a + $b))
elif [ "$op" = "-" ]; then
    Resultat=$(($a - $b))
elif [ "$op" = "*" ]; then
    Resultat=$(($a * $b))
elif [ "$op" = "/" ]; then
    Resultat=$(($a / $b))
fi
echo "Résultat : $Resultat"
exit 0