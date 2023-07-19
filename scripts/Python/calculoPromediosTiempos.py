# Eliel Avilez - PCI        Julio de 2023

# Cálculos de tiempos de ejecución de consultas

import numpy as np


ruta = '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/bash/'

nombresArchivos = ["tiemposHot.txt", "tiemposCold.txt"]

# Lista de listas, primer sublista tiemposHot, segunda sublista tiemposCold
listasTiempos = []

# Abrir archivos y guardar su contenido en listasTiempos
for nombreArchivo in nombresArchivos:
    with open(ruta + nombreArchivo, 'r') as archivo:
        listasTiempos.append(archivo.read().split("\n"))

# Primera sublista para tiemposHot y segunda sublista para tiemposCold
listaTiemposPorConsulta = [[[]], [[]]]
listaPromedios = [[], []]

# j para hot y cold, i para elementos dentro de las listas (tiempos de ejecución)
for j in range(2):
    i = 0
    
    # Iterar por todos los elementos 
    for elemento in listasTiempos[j]: 
        # Si elemento es "-", entonces ya se leyeron los 30 resultados de una consulta
        if(elemento == "-"):
            # Agregar el promedio de la consulta i a la lista de promedios
            listaPromedios[j].append(round(np.average(listaTiemposPorConsulta[j][i]), 3))
            i += 1
            
            # Fin del archivo
            if(i == 6):
                break
            # Se agrega nueva lista a la lista j
            listaTiemposPorConsulta[j].append([])
            continue
        else:
            # Agregar elemento a la lista j, i.
            listaTiemposPorConsulta[j][i].append(float(elemento))
    
    # Imprimir resultados
    if(j == 0):
        print("Promedios en tiempos de ejecución en caliente (segundos)")
    else:
        print("Promedios en tiempos de ejecución en frío (segundos)")
        
    for k in range(1,7):
        print("Consulta " + str(k) + ": ", listaPromedios[j][k-1])
        
    print("\n")

print("Relación de velocidad, consulta en caliente con respecto a consulta en frío")

for k in range(1,7):
    print("Consulta " + str(k) + ": " + str(round(((listaPromedios[1][k-1]/listaPromedios[0][k-1]) - 1) * 100, 2)) + "% más rápido")
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    