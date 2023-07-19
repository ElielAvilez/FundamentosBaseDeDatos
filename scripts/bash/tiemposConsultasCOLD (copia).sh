#!/bin/bash

TIMEFORMAT=%R

############## LIMPIAR BUFFER Y CACHÉ ##############################
# Apagar servicio psql
echo "eliel123" | sudo -S service postgresql stop;
echo "Servicio psql detenido"

# Limpiar caché y buffer
echo "eliel123" | sudo -S ./clear_cache
echo "Buffer y caché liberados"

# Iniciar servicio psql
echo "eliel123" | sudo -S service postgresql start;
echo -e "Servicio psql inciado\n"
#####################################################################

# Ejecución 1 de consulta 1 para crear el archivo de resultados tiemposCold.txt
(time psql -U eliel -d youtubestatistics -f /home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/Consulta1.sql) 1>/dev/null 2> tiemposCold.txt
echo "Consulta 1, ejecuciones: 1"

############## LIMPIAR BUFFER Y CACHÉ ##############################
# Apagar servicio psql
echo "eliel123" | sudo -S service postgresql stop;
echo "Servicio psql detenido"

# Limpiar caché y buffer
echo "eliel123" | sudo -S ./clear_cache
echo "Buffer y caché liberados"

# Iniciar servicio psql
echo "eliel123" | sudo -S service postgresql start;
echo -e "Servicio psql inciado\n"
#####################################################################

# Resto de ejecuciones de consulta 1
for ((j = 2; j <= 30; j++))
do 
    (time psql -U eliel -d youtubestatistics -f /home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/Consulta1.sql) 1>/dev/null 2>> tiemposCold.txt
    echo "Consulta 1, ejecuciones: $j"

    ############## LIMPIAR BUFFER Y CACHÉ ##############################
    # Apagar servicio psql
    echo "eliel123" | sudo -S service postgresql stop;
    echo "Servicio psql detenido"

    # Limpiar caché y buffer
    echo "eliel123" | sudo -S ./clear_cache
    echo "Buffer y caché liberados"

    # Iniciar servicio psql
    echo "eliel123" | sudo -S service postgresql start;
    echo -e "Servicio psql inciado\n"
    #####################################################################
done

echo "-" >> tiemposCold.txt

# Resto de ejecuciones de todas las consultas
for ((i = 2; i <= 6; i++))
do 
    for ((j = 1; j <= 30; j++))
    do 
        (time psql -U eliel -d youtubestatistics -f /home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/Consulta$i.sql) 1>/dev/null 2>> tiemposCold.txt
        echo "Consulta $i, ejecuciones: $j"

        ############## LIMPIAR BUFFER Y CACHÉ ##############################
        # Apagar servicio psql
        echo "eliel123" | sudo -S service postgresql stop;
        echo "Servicio psql detenido"

        # Limpiar caché y buffer
        echo "eliel123" | sudo -S ./clear_cache
        echo "Buffer y caché liberados"

        # Iniciar servicio psql
        echo "eliel123" | sudo -S service postgresql start;
        echo -e "Servicio psql inciado\n"
        #####################################################################
    done

    echo "-" >> tiemposCold.txt
done
