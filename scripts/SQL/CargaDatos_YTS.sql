-- Comando para ejecución de script:
-- psql -U eliel  -d youtubestatistics -f /home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/CargaDatos_YTS.sql


--Bulk load para archivos CSV

\COPY CategoryRegion(region, category_id, category) FROM '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/Python/extraccionCSV_Category/RegionsCategorys.csv' WITH (FORMAT csv, DELIMITER ',', HEADER TRUE, NULL '');

\COPY DataVideos_Canada(video_id,trending_date,title,channel_title,category_id,publish_time,tags,views,likes,dislikes,comment_count,thumbnail_link,comments_disabled,ratings_disabled,video_error_or_removed,description) FROM '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/Python/limpiezaCSVs_Origen/CLEAN_CAvideos.csv' WITH (FORMAT csv, DELIMITER ',', HEADER TRUE, NULL '');

\COPY DataVideos_Germany(video_id,trending_date,title,channel_title,category_id,publish_time,tags,views,likes,dislikes,comment_count,thumbnail_link,comments_disabled,ratings_disabled,video_error_or_removed,description) FROM '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/Python/limpiezaCSVs_Origen/CLEAN_DEvideos.csv' WITH (FORMAT csv, DELIMITER ',', HEADER TRUE, NULL '');

\COPY DataVideos_France(video_id,trending_date,title,channel_title,category_id,publish_time,tags,views,likes,dislikes,comment_count,thumbnail_link,comments_disabled,ratings_disabled,video_error_or_removed,description) FROM '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/Python/limpiezaCSVs_Origen/CLEAN_FRvideos.csv' WITH (FORMAT csv, DELIMITER ',', HEADER TRUE, NULL '');

\COPY DataVideos_GreatBritain(video_id,trending_date,title,channel_title,category_id,publish_time,tags,views,likes,dislikes,comment_count,thumbnail_link,comments_disabled,ratings_disabled,video_error_or_removed,description) FROM '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/Python/limpiezaCSVs_Origen/CLEAN_GBvideos.csv' WITH (FORMAT csv, DELIMITER ',', HEADER TRUE, NULL '');

\COPY DataVideos_India(video_id,trending_date,title,channel_title,category_id,publish_time,tags,views,likes,dislikes,comment_count,thumbnail_link,comments_disabled,ratings_disabled,video_error_or_removed,description) FROM '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/Python/limpiezaCSVs_Origen/CLEAN_INvideos.csv' WITH (FORMAT csv, DELIMITER ',', HEADER TRUE, NULL '');

\COPY DataVideos_Japan(video_id,trending_date,title,channel_title,category_id,publish_time,tags,views,likes,dislikes,comment_count,thumbnail_link,comments_disabled,ratings_disabled,video_error_or_removed,description) FROM '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/Python/limpiezaCSVs_Origen/CLEAN_JPvideos.csv' WITH (FORMAT csv, DELIMITER ',', HEADER TRUE, NULL '');

\COPY DataVideos_Korea(video_id,trending_date,title,channel_title,category_id,publish_time,tags,views,likes,dislikes,comment_count,thumbnail_link,comments_disabled,ratings_disabled,video_error_or_removed,description) FROM '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/Python/limpiezaCSVs_Origen/CLEAN_KRvideos.csv' WITH (FORMAT csv, DELIMITER ',', HEADER TRUE, NULL '');

\COPY DataVideos_Mexico(video_id,trending_date,title,channel_title,category_id,publish_time,tags,views,likes,dislikes,comment_count,thumbnail_link,comments_disabled,ratings_disabled,video_error_or_removed,description) FROM '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/Python/limpiezaCSVs_Origen/CLEAN_MXvideos.csv' WITH (FORMAT csv, DELIMITER ',', HEADER TRUE, NULL '');

\COPY DataVideos_Russia(video_id,trending_date,title,channel_title,category_id,publish_time,tags,views,likes,dislikes,comment_count,thumbnail_link,comments_disabled,ratings_disabled,video_error_or_removed,description) FROM '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/Python/limpiezaCSVs_Origen/CLEAN_RUvideos.csv' WITH (FORMAT csv, DELIMITER ',', HEADER TRUE, NULL '');

\COPY DataVideos_USA(video_id,trending_date,title,channel_title,category_id,publish_time,tags,views,likes,dislikes,comment_count,thumbnail_link,comments_disabled,ratings_disabled,video_error_or_removed,description) FROM '/home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/Python/limpiezaCSVs_Origen/CLEAN_USvideos.csv' WITH (FORMAT csv, DELIMITER ',', HEADER TRUE, NULL '');


-- Inserción de datos a tabla de todas las regiones
INSERT INTO DataVideos_AllRegions

SELECT 'Canada' AS region, video_id,trending_date,title,
       channel_title,CR.category,publish_time,tags,views,
       likes,dislikes,comment_count,thumbnail_link,
       comments_disabled,ratings_disabled,video_error_or_removed,description
FROM DataVideos_Canada AS DV
INNER JOIN CategoryRegion AS CR
    ON DV.category_id = CR.category_id
WHERE region = 'CA'

UNION

SELECT 'Germany' AS region, video_id,trending_date,title,
       channel_title,CR.category,publish_time,tags,views,
       likes,dislikes,comment_count,thumbnail_link,
       comments_disabled,ratings_disabled,video_error_or_removed,description
FROM DataVideos_Germany AS DV
INNER JOIN CategoryRegion AS CR
    ON DV.category_id = CR.category_id
WHERE region = 'DE'

UNION

SELECT 'France' AS region, video_id,trending_date,title,
       channel_title,CR.category,publish_time,tags,views,
       likes,dislikes,comment_count,thumbnail_link,
       comments_disabled,ratings_disabled,video_error_or_removed,description
FROM DataVideos_France AS DV
INNER JOIN CategoryRegion AS CR
    ON DV.category_id = CR.category_id
WHERE region = 'FR'

UNION

SELECT 'GreatBritain' AS region, video_id,trending_date,title,
       channel_title,CR.category,publish_time,tags,views,
       likes,dislikes,comment_count,thumbnail_link,
       comments_disabled,ratings_disabled,video_error_or_removed,description
FROM DataVideos_GreatBritain AS DV
INNER JOIN CategoryRegion AS CR
    ON DV.category_id = CR.category_id
WHERE region = 'GB'

UNION

SELECT 'India' AS region, video_id,trending_date,title,
       channel_title,CR.category,publish_time,tags,views,
       likes,dislikes,comment_count,thumbnail_link,
       comments_disabled,ratings_disabled,video_error_or_removed,description
FROM DataVideos_India AS DV
INNER JOIN CategoryRegion AS CR
    ON DV.category_id = CR.category_id
WHERE region = 'IN'

UNION

SELECT 'Japan' AS region, video_id,trending_date,title,
       channel_title,CR.category,publish_time,tags,views,
       likes,dislikes,comment_count,thumbnail_link,
       comments_disabled,ratings_disabled,video_error_or_removed,description
FROM DataVideos_Japan AS DV
INNER JOIN CategoryRegion AS CR
    ON DV.category_id = CR.category_id
WHERE region = 'JP'

UNION

SELECT 'Korea' AS region, video_id,trending_date,title,
       channel_title,CR.category,publish_time,tags,views,
       likes,dislikes,comment_count,thumbnail_link,
       comments_disabled,ratings_disabled,video_error_or_removed,description
FROM DataVideos_Korea AS DV
INNER JOIN CategoryRegion AS CR
    ON DV.category_id = CR.category_id
WHERE region = 'KR'

UNION

SELECT 'Mexico' AS region, video_id,trending_date,title,
       channel_title,CR.category,publish_time,tags,views,
       likes,dislikes,comment_count,thumbnail_link,
       comments_disabled,ratings_disabled,video_error_or_removed,description
FROM DataVideos_Mexico AS DV
INNER JOIN CategoryRegion AS CR
    ON DV.category_id = CR.category_id
WHERE region = 'MX'

UNION

SELECT 'Russia' AS region, video_id,trending_date,title,
       channel_title,CR.category,publish_time,tags,views,
       likes,dislikes,comment_count,thumbnail_link,
       comments_disabled,ratings_disabled,video_error_or_removed,description
FROM DataVideos_Russia AS DV
INNER JOIN CategoryRegion AS CR
    ON DV.category_id = CR.category_id
WHERE region = 'RU'

UNION

SELECT 'USA' AS region, video_id,trending_date,title,
       channel_title,CR.category,publish_time,tags,views,
       likes,dislikes,comment_count,thumbnail_link,
       comments_disabled,ratings_disabled,video_error_or_removed,description
FROM DataVideos_USA AS DV
INNER JOIN CategoryRegion AS CR
    ON DV.category_id = CR.category_id
WHERE region = 'US'



