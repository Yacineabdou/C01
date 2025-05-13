#!/bin/bash

# Nom du fichier dans lequel effectuer la recherche
FICHIER="ficher.txt"

# Chaîne de caractères à rechercher
CHAINE_RECHERCHEE="bonjour"

# Effectuer la recherche avec grep et compter les occurrences
NOMBRE_OCCURRENCES=$(grep -c "$CHAINE_RECHERCHEE" "$FICHIER")

# Vérifier si la chaîne a été trouvée
if [ "$NOMBRE_OCCURRENCES" -gt 0 ]; then
  echo "La chaîne '$CHAINE_RECHERCHEE' a été trouvée $NOMBRE_OCCURRENCES fois dans $FICHIER."
else
  echo "La chaîne '$CHAINE_RECHERCHEE' n'a pas été trouvée dans $FICHIER."
fi