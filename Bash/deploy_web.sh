#!/bin/bash
# Script para desplegar una aplicación web en Apache dentro de una VM

# 1. Configuración de variables
REPO_URL="https://github.com/Arcxcad/3ro-bt-informatica.git"
REPO_DIR="3ro-bt-informatica/Wiki"
APACHE_DIR="/var/www/html"

# 2. Clonar el repositorio si no existe, o actualizarlo si ya está presente
if [ ! -d "$REPO_DIR" ]; then
    echo "Clonando repositorio..."
    git clone "$REPO_URL"
else
    echo "Repositorio ya existe, actualizando..."
    cd "3ro-bt-informatica" || exit 1
    git pull origin main
fi

# 3. Detener el servicio Apache
echo "Deteniendo Apache..."
sudo systemctl stop apache2

# 4. Entrar a la carpeta Wiki dentro del repositorio
cd "$REPO_DIR" || { echo "No se pudo entrar a $REPO_DIR"; exit 1; }

# 5. Actualizar contenido con git pull
echo "Actualizando contenido..."
git pull

# 6. Cambiar a la rama develop (si existe) o crearla si no está
echo "Cambiando a la rama develop..."
if git show-ref --verify --quiet refs/heads/develop; then
    git checkout develop
else
    echo "La rama develop no existe, creando..."
    git checkout -b develop
fi

# 7. Copiar archivos de la carpeta Wiki al directorio de Apache
echo "Copiando archivos a $APACHE_DIR..."
sudo cp -r * "$APACHE_DIR"

# 8. Iniciar nuevamente el servicio Apache
echo "Iniciando Apache..."
sudo systemctl start apache2

# 9. Verificar estado de Apache
echo "Estado de Apache:"
sudo systemctl status apache2 | grep Active

echo "Completado. La página web está disponible en http://localhost (o con curl http://localhost, para ver su contenido)"
