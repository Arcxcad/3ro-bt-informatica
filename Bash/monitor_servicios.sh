#!/bin/bash
# Script para monitorear los servicios en una VM

SERVICIOS=("ssh" "apache2" "cron")
LOG="/var/log/monitor_servicios.log"

# Funcion para verificar un servicio
verificar_servicio() {
    servicio=$1
    estado=$(systemctl is-active $servicio)

    if [ "$estado" == "active" ]; then
        echo "[OK] $servicio activo"
        echo "$(date '+%Y-%m-%d %H:%M:%S') $servicio ACTIVO" >> $LOG
    else
        echo "[ERROR] $servicio detenido"
        echo "$(date '+%Y-%m-%d %H:%M:%S') $servicio DETENIDO" >> $LOG

        echo "Intentando iniciar $servicio..."
        sudo systemctl start $servicio
        sleep 1

        if [ "$(systemctl is-active $servicio)" == "active" ]; then
            echo "[OK] $servicio recuperado correctamente"
            echo "$(date '+%Y-%m-%d %H:%M:%S') $servicio RECUPERADO" >> $LOG
        else
            echo "[ERROR] $servicio no pudo recuperarse"
            echo "$(date '+%Y-%m-%d %H:%M:%S') $servicio FALLA" >> $LOG
        fi
    fi
}

# Funcion para verificar todos los servicios
verificar_todos() {
    for s in "${SERVICIOS[@]}"; do
        verificar_servicio $s
    done
}

# Funcion para mostrar los logs
mostrar_logs() {
    tail -n 10 $LOG
}

# Funcion para reiniciar todos los servicios
reiniciar_todos() {
    for s in "${SERVICIOS[@]}"; do
        echo "Reiniciando $s..."
        sudo systemctl restart $s
    done
}

# Menu interactivo
while true; do
    echo "===== MENU ====="
    echo "1 - Verificar servicios"
    echo "2 - Mostrar últimos registros"
    echo "3 - Reiniciar todos los servicios"
    echo "4 - Salir"
    read -p "Seleccione una opción: " opcion

    case $opcion in
        1) verificar_todos ;;
        2) mostrar_logs ;;
        3) reiniciar_todos ;;
        4) echo "Saliendo..."; break ;;
        *) echo "Opción no válida." ;;
    esac
done