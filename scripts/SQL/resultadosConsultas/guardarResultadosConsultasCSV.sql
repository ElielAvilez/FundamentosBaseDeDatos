-- Scripts para crear CSVs que guarden los resultados de las consultas, para presentación más gráfica.

-- Comando para ejecución de script:
-- psql -U eliel -d youtubestatistics -f /home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/resultadosConsultas/guardarResultadosConsultasCSV.sql

\COPY (SELECT DV.region, DV.likes FROM(SELECT MAX(likes) AS maxlikes FROM DataVideos_AllRegions) AS A INNER JOIN DataVideos_AllRegions AS DV ON A.maxlikes = DV.likes) TO '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/resultadosConsultas/resultadoConsulta1.csv' CSV HEADER;

\COPY (SELECT DV.title, DV.publish_time FROM(SELECT MIN(publish_time) AS minpublishtime FROM DataVideos_AllRegions) AS A INNER JOIN DataVideos_AllRegions AS DV ON A.minpublishtime = DV.publish_time) TO '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/resultadosConsultas/resultadoConsulta2.csv' CSV HEADER;

\COPY (SELECT A.anio, DV.title, A.maxviews AS views FROM(SELECT DATE_PART('YEAR', publish_time) AS anio, MAX(views) AS maxviews FROM DataVideos_AllRegions GROUP BY Anio) AS A INNER JOIN DataVideos_AllRegions AS DV ON DATE_PART('YEAR', DV.publish_time) = A.anio AND DV.views = A.maxviews ORDER BY A.anio DESC) TO '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/resultadosConsultas/resultadoConsulta3.csv' CSV HEADER;

\COPY (SELECT B.category, B.videoQty FROM(SELECT category, COUNT(title) AS videoQty FROM DataVideos_AllRegions GROUP BY category ORDER BY videoQty DESC LIMIT 1) AS A INNER JOIN (SELECT category, COUNT(title) AS videoQty FROM DataVideos_AllRegions GROUP BY category) AS B ON A.videoQty = B.videoQty) TO '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/resultadosConsultas/resultadoConsulta4.csv' CSV HEADER;

\COPY (SELECT B.category, B.title, B.views FROM(SELECT category, MAX(views) as maxviews FROM DataVideos_AllRegions GROUP BY category) AS A INNER JOIN (SELECT category, title, MAX(views) AS views FROM DataVideos_AllRegions GROUP BY category, title) AS B ON A.maxviews = B.views ORDER BY B.views DESC) TO '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/resultadosConsultas/resultadoConsulta5.csv' CSV HEADER;

\COPY (SELECT B2.region, B2.category, B2.sumviews FROM(SELECT region, MAX(sumviews) as maxviews FROM(SELECT region, category, SUM(views) as sumviews FROM DataVideos_AllRegions GROUP BY region, category) AS A1 GROUP BY region) AS A2 INNER JOIN (SELECT region, category, SUM(views) as sumviews FROM DataVideos_AllRegions GROUP BY region, category) AS B2 ON A2.maxviews = B2.sumviews) TO '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/resultadosConsultas/resultadoConsulta6.csv' CSV HEADER;

