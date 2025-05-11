#!/bin/bash

# Script pour afficher l'utilisation du disque de manière lisible
# Utilise df -h et du avec structures conditionnelles

# Fonction pour afficher l'utilisation globale des disques
show_global_usage() {
    echo "=== Utilisation globale des disques (df -h) ==="
    df -h | grep -E '^/dev|^Filesystem'  # Filtre pour afficher seulement les systèmes de fichiers pertinents
    echo ""
}

# Fonction pour vérifier et afficher l'utilisation d'un répertoire
check_directory_usage() {
    local dir="$1"
    local threshold=80  # Seuil d'alerte en pourcentage

    # Vérifier si le répertoire existe
    if [[ ! -d "$dir" ]]; then
        echo "Erreur : Le répertoire '$dir' n'existe pas."
        exit 1
    fi

    # Vérifier les permissions
    if [[ ! -r "$dir" ]]; then
        echo "Erreur : Permissions insuffisantes pour lire '$dir'."
        exit 1
    fi

    echo "=== Utilisation du répertoire : $dir ==="
    # Afficher la taille totale du répertoire
    du -sh "$dir" 2>/dev/null | sort -h
    echo ""

    # Vérifier l'utilisation globale du système de fichiers contenant le répertoire
    local usage
    usage=$(df -h "$dir" | tail -1 | awk '{print $5}' | cut -d'%' -f1)
    
    # Alerte si l'utilisation dépasse le seuil
    if [[ "$usage" -gt "$threshold" ]]; then
        echo "⚠️ ALERTE : Utilisation du disque à $usage% (seuil : $threshold%) pour le système contenant $dir"
    else
        echo "Utilisation du disque : $usage% (sous le seuil de $threshold%)"
    fi
}

# Vérifier si un argument est passé
if [[ $# -eq 0 ]]; then
    echo "Aucun répertoire spécifié. Analyse de /home par défaut."
    directory="/home"
else
    directory="$1"
fi

# Appeler les fonctions
show_global_usage
check_directory_usage "$directory"

exit 0