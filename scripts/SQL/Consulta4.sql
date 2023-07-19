-- ¿Cuál es la categoría con más videos? 

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