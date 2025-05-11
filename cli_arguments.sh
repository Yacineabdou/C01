#!/bin/bash

# Vérifier s'il y a des arguments
if [ $# -eq 0 ]; then
    echo "Erreur : Aucun argument fourni"
    echo "Usage : $0 <argument1> [argument2 ...]"
    exit 1
fi

# Compteur pour numéroter les arguments
compteur=1

# Parcourir tous les arguments avec $@
for arg in "$@"; do
    echo "Argument $compteur: $arg"
    ((compteur++))
done