# Eliel Avilez - PCI        Julio de 2023

# Extraer los id de categoría y descripción de los archivos JSON de cada región para
# crear archivos CSV que contenga el esquema <region, category_id, category>.

import os
import json
import pandas as pd
  
# Guardar nombres de archivos JSON en lista
ruta = '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/archive/'
archivosJSON = [nombreArchivo for nombreArchivo in os.listdir(ruta) if nombreArchivo.endswith('.json')]

####### Abrir archivos JSON y extraer sus datos ########
i = 0  # i: índice de categorías dentro de JSON

# Dataframe vacio que almacena todos los datos
dfCompleto = pd.DataFrame(columns = ['region', 'category_id', 'category'])

for archivo in archivosJSON:
    # Abrir archivos JSON e insertar sus datos en datosArchivo
    with open(ruta + archivo, 'r') as f:
        datosArchivo = json.load(f)
    
    # Guardar en lista los valores de category_id y category
    datosDF = []
    for elemento in datosArchivo["items"]:
        datosDF.append([archivo[0:2], 
                        datosArchivo["items"][i]["id"], 
                        datosArchivo["items"][i]["snippet"]["title"]])
        i += 1
        
    # Insertar datos de dataframe de región
    dfRegion = pd.DataFrame(datosDF, columns=['region', 'category_id', 'category'])
    
    # Agregar datos de dataframe de región en dataframe completo
    dfCompleto = dfCompleto.append(dfRegion)
    
    i = 0


# Guardar dataframe en CSV
dfCompleto.to_csv('RegionsCategorys.csv', index=False)
