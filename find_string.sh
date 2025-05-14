#!/bin/bash

# Nom du fichier dans lequel effectuer la recherche
read f

# Chaîne de caractères à rechercher
read c

# Vérifier si la chaîne a été trouvée
if  grep -q "$c" "$f"; then
  echo "La chaîne '$c' a été trouvée dans $f."
else
  echo "La chaîne '$c' n'a pas été trouvée dans $f."
fi