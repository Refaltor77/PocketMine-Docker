#!/bin/bash

# Arrête l'exécution si une commande échoue
set -e

# Couleurs pour un affichage stylisé
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # Pas de couleur

echo -e "${CYAN}Construction de l'image Docker...${NC}"
docker build . -t server

echo -e "${CYAN}Démarrage des services Docker Compose...${NC}"
docker-compose up -d

if [ $? -eq 0 ]; then
  echo -e "${GREEN}Le serveur PocketMine est en cours d'exécution !${NC}"
  echo -e "Vous pouvez maintenant vous connecter à votre serveur sur le port ${GREEN}19132${NC}."
else
  echo -e "${RED}Une erreur s
