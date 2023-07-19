#!/bin/bash

TIMEFORMAT=%R

# Ejecución para mantener datos en buffer
psql -U eliel -d youtubestatistics -f /home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/Consulta1.sql 1>/dev/null

echo "Ejecución para buffer"

# Ejecución 1 de consulta 1 para crear el archivo de resultados tiemposHot.txt
(time psql -U eliel -d youtubestatistics -f /home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/Consulta1.sql) 1>/dev/null 2> tiemposHot.txt
echo "Consulta 1, ejecuciones: 1"

# Resto de ejecuciones de consulta 1
for ((j = 2; j <= 30; j++))
do 
    (time psql -U eliel -d youtubestatistics -f /home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/Consulta1.sql) 1>/dev/null 2>> tiemposHot.txt
    echo "Consulta 1, ejecuciones: $j"
done

echo "-" >> tiemposHot.txt

# Resto de ejecuciones de todas las consultas
for ((i = 2; i <= 6; i++))
do 
    for ((j = 1; j <= 30; j++))
    do 
        (time psql -U eliel -d youtubestatistics -f /home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/Consulta$i.sql) 1>/dev/null 2>> tiemposHot.txt
        echo "Consulta $i, ejecuciones: $j"
    done

    echo "-" >> tiemposHot.txt
done


