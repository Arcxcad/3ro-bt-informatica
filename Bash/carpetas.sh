#!/bin/bash
# Script para crear carpetas

directorio_base="data"

#Creando carpeta base data, si no existe crea una
echo "Verificando si la carpeta $directorio_base existe..."
if [ ! -d "$directorio_base" ]; then
    mkdir "$directorio_base"
    echo "Carpeta $directorio_base creada."
else
    echo "La carpeta $directorio_base ya existe."
fi

# Creando subcarpetas dentro de data
echo "###########################################################"
echo "Creando subcarpetas dentro de $directorio_base..."
# Creando subcarpetas dentro de data
echo "Creando $directorio_base/images"
mkdir -p "$directorio_base/images"
echo "Creando $directorio_base/documents"
mkdir -p "$directorio_base/documents"
echo "Creando $directorio_base/compressed"
mkdir -p "$directorio_base/compressed"
echo "Creando $directorio_base/logs"
mkdir -p "$directorio_base/logs"
echo "Creando $directorio_base/scripts"
mkdir -p "$directorio_base/scripts"
echo "Creando $directorio_base/others"
mkdir -p "$directorio_base/others"
echo "###########################################################"

# Cantidades de archivos de texto, logs y scripts
echo "Creando archivos de texto..."
echo "¿Cuántos archivos de texto deseas crear en $directorio_base/documents?"
read cant_txt
while ! [[ "$cant_txt" =~ ^[0-9]+$ ]]; do
    echo "Por favor, ingresa un número válido."
    read cant_txt
done
echo "Archivos de texto creados."
echo "###########################################################"

echo "Creando archivos de log..."
echo "¿Cuántos archivos de log deseas crear en $directorio_base/logs?"
read cant_log
while ! [[ "$cant_log" =~ ^[0-9]+$ ]]; do
    echo "Por favor, ingresa un número válido."
    read cant_log
done
echo "Archivos de log creados."
echo "###########################################################"

echo "Creando archivos de script..."
echo "¿Cuántos archivos de script deseas crear en $directorio_base/scripts?"
read cant_script
while ! [[ "$cant_script" =~ ^[0-9]+$ ]]; do
    echo "Por favor, ingresa un número válido."
    read cant_script
done
echo "Archivos de script creados."
echo "###########################################################"

# Creando archivos de texto, logs y scripts
echo "Generando archivos de texto..."
i=1
while [ $i -le $cant_txt ]; do
    echo "Generando archivo${i}.txt en documents..."
    echo "Contenido de ejemplo ${i}" > "$directorio_base/documents/archivo${i}.txt"
    i=$((i + 1))
done
echo "Archivos de texto creados."
echo "###########################################################"

echo "Generando archivos logs..."
i=1
while [ $i -le $cant_log ]; do
    echo "Generando log${i}.log en logs..."
    echo "Log de ejemplo ${i}" > "$directorio_base/logs/log${i}.log"
    i=$((i + 1))
done
echo "Archivos de log creados." 
echo "###########################################################"

echo "Generando archivos scripts..."
i=1
while [ $i -le $cant_script ]; do
    echo "Generando script${i}.sh en scripts..."
    echo "#!/bin/bash" > "$directorio_base/scripts/script${i}.sh"
    echo "echo 'Este es el script ${i}'" >> "$directorio_base/scripts/script${i}.sh"
    chmod +x "$directorio_base/scripts/script${i}.sh"
    i=$((i + 1))
done
echo "Archivos de script creados."
echo "###########################################################"

echo "¡Proceso completado! Las carpetas y archivos han sido creados en $directorio_base."