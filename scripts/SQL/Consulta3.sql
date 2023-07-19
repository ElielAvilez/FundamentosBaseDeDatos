-- ¿Cuál fue el video más popular (con más vistas) por cada año (usar fecha de publicación)?

SELECT A.anio, DV.title, A.maxviews AS views
FROM(
        SELECT DATE_PART('YEAR', publish_time) AS anio, MAX(views) AS maxviews
        FROM DataVideos_AllRegions
        GROUP BY Anio
    ) AS A
INNER JOIN DataVideos_AllRegions AS DV
    ON DATE_PART('YEAR', DV.publish_time) = A.anio AND DV.views = A.maxviews
ORDER BY A.anio DESC;