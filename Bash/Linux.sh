#!/bin/bash
# Script muy basico para monitorear servicios en Linux

// Definir los servicios a monitorear
SERVICIOS=("ssh" "apache2" "cron")
LOG="/var/log/monitor_servicios.log"

// Mostrar menu de opciones
while true; do
    echo "===== MENU ====="
    echo "1) Verificar servicios"
    echo "2) Mostrar ultimos registros"
    echo "3) Reiniciar todos los servicios"
    echo "4) Salir"
    read -p "Seleccione una opcion: " opcion

    // Procesar la opcion seleccionada
    if [ "$opcion" == "1" ]; then
        echo "Verificando servicios..."
        for servicio in "${SERVICIOS[@]}"; do
            estado=$(systemctl is-active $servicio)
            if [ "$estado" == "active" ]; then
                echo "[OK] $servicio activo"
                echo "$(date '+%Y-%m-%d %H:%M:%S') $servicio ACTIVO" >> $LOG
            else
                echo "[ERROR] $servicio detenido"
                echo "$(date '+%Y-%m-%d %H:%M:%S') $servicio DETENIDO" >> $LOG
                echo "Intentando iniciar $servicio..."
                sudo systemctl start $servicio
            fi
        done

    // Mostrar ultimos registros del log
    elif [ "$opcion" == "2" ]; then
        echo "Mostrando ultimos registros..."
        tail -n 10 $LOG

    // Reiniciar todos los servicios
    elif [ "$opcion" == "3" ]; then
        echo "Reiniciando todos los servicios..."
        for servicio in "${SERVICIOS[@]}"; do
            sudo systemctl restart $servicio
            echo "$servicio reiniciado"
        done

    // Salir del script
    elif [ "$opcion" == "4" ]; then
        echo "Saliendo..."
        break

    else
        echo "Opcion no valida"
    fi
done
