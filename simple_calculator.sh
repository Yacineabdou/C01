#!/bin/bash

# Vérifier si le nombre correct d'arguments est fourni
if [ $# -ne 3 ]; then
  echo "Usage: $0 <nombre1> <nombre2> <operateur>"
  echo "Operateurs possibles : +, -, *, /"
  exit 1
fi

nombre1="$1"
nombre2="$2"
operateur="$3"

# Vérifier si les entrées sont des nombres
if ! [[ "$nombre1" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$nombre2" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Erreur: Les deux premiers arguments doivent être des nombres."
  exit 1
fi

# Effectuer l'opération en fonction de l'opérateur
case "$operateur" in
  "+")
    resultat=$(echo "$nombre1 + $nombre2" | bc)
    echo "Résultat : $resultat"
    ;;
  "-")
    resultat=$(echo "$nombre1 - $nombre2" | bc)
    echo "Résultat : $resultat"
    ;;
  "*")
    resultat=$(echo "$nombre1 * $nombre2" | bc)
    echo "Résultat : $resultat"
    ;;
  "/")
    if [ $(echo "$nombre2 == 0" | bc -l) -eq 1 ]; then
      echo "Erreur: Division par zéro impossible."
      exit 1
    fi
    resultat=$(echo "scale=2; $nombre1 / $nombre2" | bc -l) # scale=2 pour 2 décimales
    echo "Résultat : $resultat"
    ;;
  *)
    echo "Erreur: Opérateur '$operateur' non reconnu. Utilisez +, -, *, /."
    exit 1
    ;;
esac

exit 0