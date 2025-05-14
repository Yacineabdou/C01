#!/bin/bash

# Compteur pour numéroter les arguments
compteur=1

# Parcourir tous les arguments avec $@
for arg in "$@"; do
    echo "Argument $compteur : $arg"
    ((compteur++))
done