#!/bin/bash

# ça nous permet de crée un script qui compte le nombre de fichiers dans un répertoire.
read myfolder
repertoire="$(ls "$myfolder" | wc -l)"
repertory=$(echo $repertoire)
echo "Le dossier "$myfolder" contient "$repertory" fichier(s)."