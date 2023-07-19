# Eliel Avilez - PCI        Julio de 2023

# Limpiar datos de archivos CSV que contienen datos de videos

import os
import csv
import pandas as pd
  
# Guardar nombres de archivos CSV en lista
ruta = '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/archive/'
archivosCSV = [nombreArchivo for nombreArchivo in os.listdir(ruta) if nombreArchivo.endswith('.csv')]

####### Abrir archivos CSV y extraer sus datos ########
i = 0

for nombreArchivo in archivosCSV:
    with open(ruta + nombreArchivo, 'r', errors = 'replace') as archivo:
        lectorCSV = csv.reader(archivo, delimiter = ',')
        
        listaLineasCSV = []
        
        # Leer línea por línea CSV
        for linea in lectorCSV:
            # Guardar cabecero del archivo 
            if(i == 0):
                cabecero = linea
                i += 1
            else:
                # Si la última columna no está vacía y no está entre comillas, agregar comillas
                if(linea[15] != "" and linea[15][0] != '"'):
                    linea[15] = '"' + linea[15] + '"'
                
                # Dar formato YYYY-MM-DD a la fecha de la 2da columna
                linea[1] = "20" + linea[1][0:2] + "-" + linea[1][6:8] + "-" + linea[1][3:5]
                
                # Agregar línea arreglada a listaLineasCSV
                listaLineasCSV.append(linea)
                
        # Agregar datos de listaLineasCSV a un dataframe
        dfArchivo = pd.DataFrame(listaLineasCSV, columns = cabecero)
    
    # Guardar archivo CSV nuevo con información reparada
    dfArchivo.to_csv('CLEAN_' + nombreArchivo, index = False)
    
    i  = 0











# df = pd.read_csv(ruta + 'KRvideos.csv', encoding = 'utf-8-sig')

# df = pd.DataFrame(columns = ['video_id', 'trending_date', 'title', 'channel_title', 
#                              'category_id', 'publish_time', 'tags', 'views', 'likes', 
#                              'dislikes', 'comment_count', 'thumbnail_link', 'comments_disabled', 
#                              'ratings_disabled', 'video_error_or_removed', 'description'])

# f = open(ruta + 'KRvideos.csv', encoding="utf-8", errors='replace')
# 


# with open(ruta + 'KRvideos.csv', 'r') as archivo:
#     lectorCSV = csv.reader(archivo, delimiter = ',')
    
#     for linea in lectorCSV:
#         if(i == 0):
#             cabecero = linea
#             i += 1
#         else:
#             if(linea[15] != "" and linea[15][0] != '"'):
#                 linea[15] = '"' + linea[15] + '"'
            
#             listaCompleta.append(linea)
            
            
            
#     df = pd.DataFrame(listaCompleta, columns = cabecero)


# df.loc[len(df)] = linea

# df = df.append(pd.DataFrame(linea, columns=[ 'Name', 'Age', 'City', 'Country']),
#                 ignore_index = True)

# print(linea)


# for line in f:
#     lineaLista = line.split(',')
    
#     if(i == 0):
#         df = pd.DataFrame(columns = lineaLista)
#         i += 1
#         continue
#     else:
#         # df = df.append(pd.DataFrame(line.split(',')))
        
#         # print(pd.DataFrame(line.split(',')))
        
#         print()
#         df.loc[len(df)] = lineaLista
        
        
    
    
    
    
    
# print(df)

# for archivo in archivosCSV:
#     df = pd.read_csv(ruta + archivo, encoding = 'utf-8')
#     ListaContenidoArchivos.append(df)






