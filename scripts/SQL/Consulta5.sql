-- ¿Cuál es el video más popular por categoría?

\pset pager off

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
