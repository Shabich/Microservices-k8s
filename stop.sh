#!/usr/bin/env bash
# Supprime tous les objets du projet (Deployments, Services, Ingress).
# L'Ingress Controller NGINX et les images Docker sont conservés.
# Usage : ./stop.sh

# Arrête le script à la première erreur
set -euo pipefail

# Se place à la racine du projet (le dossier qui contient ce script)
cd "$(dirname "$0")"

# Se placer sur le cluster local de Docker Desktop
kubectl config use-context docker-desktop

# Supprime tout ce qui est décrit dans k8s/ (--ignore-not-found : pas d'erreur si déjà supprimé)
kubectl delete -f k8s/ --ignore-not-found

echo "Projet arrêté"
