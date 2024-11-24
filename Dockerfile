# Utilisation de l'image Debian slim
FROM debian:12

# Mise à jour et installation des dépendances nécessaires
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        curl \
        zip \
        unzip \
        wget \
        git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


# Définition du répertoire de travail
WORKDIR /server

# Copy des données nécessaires pour le serveur PocketMine
COPY configurations/ ./
COPY resources/php.tar.gz ./php.tar.gz
COPY resources/PocketMine-MP.phar ./PocketMine-MP.phar
COPY resources/start.sh ./start.sh
COPY worlds/ ./worlds/
COPY plugins/ ./plugins/
COPY resource_packs/ ./resource_packs/

# Extraction du bin PHP et nettoyage de l'archive
RUN tar -xzf php.tar.gz && rm php.tar.gz

# Rendre le script start.sh exécutable
RUN chmod +x start.sh

# Lancement du script au démarrage
CMD ["./start.sh"]
