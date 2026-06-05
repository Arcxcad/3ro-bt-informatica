#!/bin/bash
# Script basico de backup por tipo de archivo

# Creando carpeta backups, si no existe crea una
echo "Que tipo de archivo quieres respaldar? (ejemplo: txt, sh, log)"
read extension

echo "Creando carpeta backups..."
if [ ! -d backups ]; then
    echo "Carpeta backups creada."
    mkdir backups
else
    echo "La carpeta backups ya existe."
fi
echo "###########################################################"

echo "Verificando si la carpeta data existe..."
if [ ! -d data ]; then
    echo "La carpeta data no existe, creando carpeta data..."
    mkdir data
fi

# Buscando archivos por extension y mostrando resultados
echo "###########################################################"
echo "Buscando archivos .$extension en data..."
archivos=$(find . -type f -iname "*.$extension")

if [ -z "$archivos" ]; then
    echo "No se encontraron archivos .$extension"
    exit 1
fi
echo "###########################################################"

echo "Archivos .$extension encontrados:"
echo "Archivos encontrados:"
for archivo in $archivos
do
    echo "$archivo"
done
echo "###########################################################"

# Creando backup por hora y fecha
echo "Creando backup por hora y fecha..."
fecha=$(date +%Y-%m-%d_%H-%M-%S)
nombre="backup_${extension}_${fecha}.tar.gz"
echo "###########################################################"

echo "Generando backup $nombre..."
if [ "$1" == "-v" ]; then
    tar -czvf backups/$nombre $archivos
else
    tar -czf backups/$nombre $archivos
fi
echo "###########################################################"

echo "Backup generado correctamente en la carpeta backups."
