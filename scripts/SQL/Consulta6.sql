-- ¿Cuál es la categoría más popular por región?

SELECT B2.region, B2.category, B2.sumviews
FROM(
        SELECT region, MAX(sumviews) as maxviews
        FROM(
                SELECT region, category, SUM(views) as sumviews
                FROM DataVideos_AllRegions
                GROUP BY region, category
            ) AS A1
        GROUP BY region
    ) AS A2
INNER JOIN (
                SELECT region, category, SUM(views) as sumviews
                FROM DataVideos_AllRegions
                GROUP BY region, category
           ) AS B2
    ON A2.maxviews = B2.sumviews;

