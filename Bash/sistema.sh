#!/bin/bash
# Script sistema.sh

opcion=0


while true
do
    echo "===== MENU PRINCIPAL ====="
    echo "1. Listar archivos"
    echo "2. Procesar archivos .txt"
    echo "3. Control de numero"
    echo "4. Verificar archivo"
    echo "5. Salir"
    echo "6. Backup automatico"
    echo "=========================="
    echo "Elige una opcion:"
    read opcion

    case $opcion in
        1)
            echo "Archivos en el directorio actual:"
            contador=0
            for archivo in *
            do
                echo "$archivo"
                contador=$((contador+1))
            done
            echo "Total de archivos: $contador"
            ;;
        2)
            echo "Procesando archivos .txt..."
            contador=0
            for archivo in *.txt
            do
                if [ -e "$archivo" ]; then
                    echo "Archivo: $archivo"
                    if [ -r "$archivo" ]; then
                        echo "Tiene permiso de lectura"
                    else
                        echo "NO tiene permiso de lectura"
                    fi
                    contador=$((contador+1))
                fi
            done
            echo "Total de archivos .txt: $contador"
            ;;
        3)
            numero=0
            while [ $numero -le 10 ]
            do
                echo "Ingresa un numero mayor a 10:"
                read numero
                if [ $numero -le 10 ]; then
                    echo "El numero es $numero, todavia no es mayor a 10."
                fi
            done
            if [ $((numero % 2)) -eq 0 ]; then
                echo "El numero $numero es PAR"
            else
                echo "El numero $numero es IMPAR"
            fi
            ;;
        4)
            echo "Ingresa el nombre del archivo a verificar:"
            read archivo
            if [ -e "$archivo" ]; then
                echo "El archivo existe."
                if [ -f "$archivo" ]; then
                    echo "Es un archivo normal."
                elif [ -d "$archivo" ]; then
                    echo "Es un directorio."
                fi
                if [ -x "$archivo" ]; then
                    echo "Tiene permisos de ejecucion."
                else
                    echo "NO tiene permisos de ejecucion."
                fi
            else
                echo "El archivo NO existe."
            fi
            ;;
        5)
            echo "Saliendo del programa..."
            break
            ;;
        6)
            echo "Realizando backup..."
            if [ ! -d backup ]; then
                mkdir backup
                echo "Carpeta 'backup' creada."
            fi
            for archivo in *.txt
            do
                if [ -e "$archivo" ]; then
                    cp "$archivo" backup/
                fi
            done
            echo "Archivos .txt copiados a 'backup'."
            ;;
        *)
            echo "Opcion invalida, intenta de nuevo."
            ;;
    esac
done