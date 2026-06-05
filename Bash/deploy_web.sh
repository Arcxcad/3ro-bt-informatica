#!/bin/bash
# Script para desplegar una aplicación web en una VM

#1 clonar el repositorio 
REPO_URL="https://github.com/ejemplo/app-web.git"
REPO_DIR="WIKI"

if [ ! -d "$REPO_DIR" ]; then
    echo "Clonando el repositorio en $REPO_DIR..."
    git clone "$REPO_URL"
else
    echo "El repositorio ya existe en $REPO_DIR. Actualizando..."
    git pull origin main
fi

#2 Detener apache
echo "Deteniendo el servicio Apache..."
sudo systemctl stop apache2

#3 Ingresando al repositorio
cd "$REPO_DIR" || { echo "No se pudo ingresar al directorio $REPO_DIR"; exit 1; }

#4 Actualizar el contenido
echo "Actualizando el contenido con git pull..."
git pull

#5 Cambiar a la rama develop
echo "Cambiando a la rama develop..."
git checkout develop

#6 Copiar archivos a la carpeta de apache
echo "Copiando archivos a la carpeta de Apache /var/www/html..."
APACHE_DIR="/var/www/html"
echo "Copiando archivos a $APACHE_DIR..."
sudo cp -r * "$APACHE_DIR"

#7 Iniciar apache
echo "Iniciando el servicio Apache..."
sudo systemctl start apache2

#8 Verificar el estado del servicio
echo "Verificando el estado del servicio Apache..."
sudo systemctl status apache2 | grep Active

echo "Despliegue completado. La aplicación web debería estar disponible en http://localhost"