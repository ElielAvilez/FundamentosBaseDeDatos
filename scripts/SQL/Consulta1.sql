-- ¿Cuál es la región que tiene el video con mayor número de likes?

SELECT DV.region, DV.likes
FROM(
        SELECT MAX(likes) AS maxlikes
        FROM DataVideos_AllRegions
    ) AS A
INNER JOIN DataVideos_AllRegions AS DV
    ON A.maxlikes = DV.likes;

