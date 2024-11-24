@echo off
setlocal

echo Construction de l'image Docker...
docker build . -t server
if errorlevel 1 (
    echo Une erreur s'est produite lors de la construction de l'image Docker.
    pause
    exit /b 1
)

echo.
echo Démarrage des services Docker Compose...
docker-compose up -d
if errorlevel 1 (
    echo Une erreur s'est produite lors du démarrage des services.
    pause
    exit /b 1
)

echo.
echo Le serveur PocketMine est en cours d'exécution !
echo Vous pouvez maintenant vous connecter à v
