#!/bin/bash
#Script para monitorear el estado de los servicios en una VM
Servicios=("ssh" "apache2" "cron")

echo "1) Vetificar servicios"
echo "2) Mostrar ultimos resultados"
echo "3) Reiniciar todos los servicios"
echo "4) Salir"
read -p "Seleccione una opción: " opcion

case $opcion in
    1)
        echo "Verificando servicios..."
        for servicio in "${Servicios[@]}"; do
            sudo systemctl status "$servicio" | grep Active
        done
        echo "Verificación completada."
        ;;
    2)
        echo "Mostrando ultimos resultados..."
        for servicio in "${Servicios[@]}"; do
            journalctl -u "$servicio" -n 10 --no-pager
        done
        echo "Resultados mostrados."
        echo "Almacenando resultados en /var/log/monitor_servicios.log..."
        for servicio in "${Servicios[@]}"; do
            journalctl -u "$servicio" -n 10 --no-pager >> /var/log/monitor_servicios.log
        done
        echo "Resultados almacenados en /var/log/monitor_servicios.log."
        ;;
    3)
        echo "Reiniciando todos los servicios..."
        for servicio in "${Servicios[@]}"; do
            sudo systemctl restart "$servicio"
        done
        echo "Servicios reiniciados."

        echo "Verificando el estado de los servicios después del reinicio..."
        for servicio in "${Servicios[@]}"; do
            sudo systemctl status "$servicio" | grep Active
        done
        echo "Reinicio completado."
        ;;
    4)
        echo "Saliendo..."
        exit 0
        ;;
    *)
        echo "Opción no válida. Por favor seleccione una opción del 1 al 4."
        ;;
esac