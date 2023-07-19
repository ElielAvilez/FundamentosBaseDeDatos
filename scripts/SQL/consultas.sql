-- Consultas de tarea 3

-- 1. ¿Cuál es la región que tiene el video con mayor número de likes?

SELECT DV.region, DV.likes
FROM(
        SELECT MAX(likes) AS maxlikes
        FROM DataVideos_AllRegions
    ) AS A
INNER JOIN DataVideos_AllRegions AS DV
    ON A.maxlikes = DV.likes;

-- 2. ¿Cuál es el video más antiguo?

SELECT DV.title, DV.publish_time
FROM(
        SELECT MIN(publish_time) AS minpublishtime
        FROM DataVideos_AllRegions
    ) AS A
INNER JOIN DataVideos_AllRegions AS DV
    ON A.minpublishtime = DV.publish_time;

-- 3. ¿Cuál fue el video más popular (con más vistas) por cada año (usar fecha de publicación)?

SELECT A.anio, DV.title, A.maxviews AS views
FROM(
        SELECT DATE_PART('YEAR', publish_time) AS anio, MAX(views) AS maxviews
        FROM DataVideos_AllRegions
        GROUP BY Anio
    ) AS A
INNER JOIN DataVideos_AllRegions AS DV
    ON DATE_PART('YEAR', DV.publish_time) = A.anio AND DV.views = A.maxviews
ORDER BY A.anio DESC;


-- 4. ¿Cuál es la categoría con más videos? 

SELECT B.category, B.videoQty
FROM(
        SELECT category, COUNT(title) AS videoQty
        FROM DataVideos_AllRegions
        GROUP BY category
        ORDER BY videoQty DESC
        LIMIT 1
    ) AS A
INNER JOIN (
                SELECT category, COUNT(title) AS videoQty
                FROM DataVideos_AllRegions
                GROUP BY category
           ) AS B
    ON A.videoQty = B.videoQty;


-- 5. ¿Cuál es el video más popular por categoría?

SELECT B.category, B.title, B.views
FROM(
        SELECT category, MAX(views) as maxviews
        FROM DataVideos_AllRegions
        GROUP BY category
    ) AS A
INNER JOIN (
                SELECT category, title, MAX(views) AS views
                FROM DataVideos_AllRegions
                GROUP BY category, title
           ) AS B
    ON A.maxviews = B.views
ORDER BY B.views DESC;



-- 6. ¿Cuál es la categoría más popular por región?

SELECT B2.region, B2.category, B2.sumviews
FROM(
        SELECT region, MAX(sumviews) AS maxviews
        FROM(
                SELECT region, category, SUM(views) AS sumviews
                FROM DataVideos_AllRegions
                GROUP BY region, category
            ) AS A1
        GROUP BY region
    ) AS A2
INNER JOIN (
                SELECT region, category, SUM(views) AS sumviews
                FROM DataVideos_AllRegions
                GROUP BY region, category
           ) AS B2
    ON A2.maxviews = B2.sumviews;







