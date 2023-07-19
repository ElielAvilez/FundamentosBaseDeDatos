-- ¿Cuál es el video más antiguo?

SELECT DV.title, DV.publish_time
FROM(
        SELECT MIN(publish_time) AS minpublishtime
        FROM DataVideos_AllRegions
    ) AS A
INNER JOIN DataVideos_AllRegions AS DV
    ON A.minpublishtime = DV.publish_time;