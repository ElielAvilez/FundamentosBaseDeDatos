-- Comando para ejecución de script:
-- psql -U eliel -d youtubestatistics -f /home/eliel/Posgrado/Semestre2/FundamentosBaseDeDatos/Tarea3/scripts/SQL/CREATE_TABLES_YTS.sql

-- Categorías por región
DROP TABLE IF EXISTS CategoryRegion;

CREATE TABLE CategoryRegion 
(
     region CHAR(20)
    ,category_id INTEGER
    ,category CHAR(100)
);

-- Videos Canadá
DROP TABLE IF EXISTS DataVideos_Canada;

CREATE TABLE DataVideos_Canada
(
     video_id CHAR(20)
    ,trending_date DATE
    ,title CHAR(100)
    ,channel_title CHAR(100)
    ,category_id INTEGER
    ,publish_time TIMESTAMP(2)
    ,tags CHAR(1000)
    ,views BIGINT
    ,likes BIGINT
    ,dislikes BIGINT
    ,comment_count INTEGER
    ,thumbnail_link	CHAR(100)
    ,comments_disabled BOOLEAN
    ,ratings_disabled BOOLEAN
    ,video_error_or_removed	BOOLEAN
    ,description CHAR(6000)
);

-- Videos Germany
DROP TABLE IF EXISTS DataVideos_Germany;

CREATE TABLE DataVideos_Germany
(
     video_id CHAR(20)
    ,trending_date DATE
    ,title CHAR(100)
    ,channel_title CHAR(100)
    ,category_id INTEGER
    ,publish_time TIMESTAMP(2)
    ,tags CHAR(1000)
    ,views BIGINT
    ,likes BIGINT
    ,dislikes BIGINT
    ,comment_count INTEGER
    ,thumbnail_link	CHAR(100)
    ,comments_disabled BOOLEAN
    ,ratings_disabled BOOLEAN
    ,video_error_or_removed	BOOLEAN
    ,description CHAR(6000)
);



-- Videos France
DROP TABLE IF EXISTS DataVideos_France;

CREATE TABLE DataVideos_France
(
     video_id CHAR(20)
    ,trending_date DATE
    ,title CHAR(100)
    ,channel_title CHAR(100)
    ,category_id INTEGER
    ,publish_time TIMESTAMP(2)
    ,tags CHAR(1000)
    ,views BIGINT
    ,likes BIGINT
    ,dislikes BIGINT
    ,comment_count INTEGER
    ,thumbnail_link	CHAR(100)
    ,comments_disabled BOOLEAN
    ,ratings_disabled BOOLEAN
    ,video_error_or_removed	BOOLEAN
    ,description CHAR(6000)
);


-- Videos GranBretaña
DROP TABLE IF EXISTS DataVideos_GreatBritain;

CREATE TABLE DataVideos_GreatBritain
(
     video_id CHAR(20)
    ,trending_date DATE
    ,title CHAR(100)
    ,channel_title CHAR(100)
    ,category_id INTEGER
    ,publish_time TIMESTAMP(2)
    ,tags CHAR(1000)
    ,views BIGINT
    ,likes BIGINT
    ,dislikes BIGINT
    ,comment_count INTEGER
    ,thumbnail_link	CHAR(100)
    ,comments_disabled BOOLEAN
    ,ratings_disabled BOOLEAN
    ,video_error_or_removed	BOOLEAN
    ,description CHAR(6000)
);


-- Videos India
DROP TABLE IF EXISTS DataVideos_India;

CREATE TABLE DataVideos_India
(
     video_id CHAR(20)
    ,trending_date DATE
    ,title CHAR(100)
    ,channel_title CHAR(100)
    ,category_id INTEGER
    ,publish_time TIMESTAMP(2)
    ,tags CHAR(1000)
    ,views BIGINT
    ,likes BIGINT
    ,dislikes BIGINT
    ,comment_count INTEGER
    ,thumbnail_link	CHAR(100)
    ,comments_disabled BOOLEAN
    ,ratings_disabled BOOLEAN
    ,video_error_or_removed	BOOLEAN
    ,description CHAR(6000)
);


-- Videos Japón
DROP TABLE IF EXISTS DataVideos_Japan;

CREATE TABLE DataVideos_Japan
(
     video_id CHAR(20)
    ,trending_date DATE
    ,title CHAR(100)
    ,channel_title CHAR(100)
    ,category_id INTEGER
    ,publish_time TIMESTAMP(2)
    ,tags CHAR(1000)
    ,views BIGINT
    ,likes BIGINT
    ,dislikes BIGINT
    ,comment_count INTEGER
    ,thumbnail_link	CHAR(100)
    ,comments_disabled BOOLEAN
    ,ratings_disabled BOOLEAN
    ,video_error_or_removed	BOOLEAN
    ,description CHAR(6000)
);


-- Videos Korea
DROP TABLE IF EXISTS DataVideos_Korea;

CREATE TABLE DataVideos_Korea
(
     video_id CHAR(20)
    ,trending_date DATE
    ,title CHAR(100)
    ,channel_title CHAR(100)
    ,category_id INTEGER
    ,publish_time TIMESTAMP(2)
    ,tags CHAR(1000)
    ,views BIGINT
    ,likes BIGINT
    ,dislikes BIGINT
    ,comment_count INTEGER
    ,thumbnail_link	CHAR(100)
    ,comments_disabled BOOLEAN
    ,ratings_disabled BOOLEAN
    ,video_error_or_removed	BOOLEAN
    ,description CHAR(6000)
);



-- Videos México
DROP TABLE IF EXISTS DataVideos_Mexico;

CREATE TABLE DataVideos_Mexico
(
     video_id CHAR(20)
    ,trending_date DATE
    ,title CHAR(100)
    ,channel_title CHAR(100)
    ,category_id INTEGER
    ,publish_time TIMESTAMP(2)
    ,tags CHAR(1000)
    ,views BIGINT
    ,likes BIGINT
    ,dislikes BIGINT
    ,comment_count INTEGER
    ,thumbnail_link	CHAR(100)
    ,comments_disabled BOOLEAN
    ,ratings_disabled BOOLEAN
    ,video_error_or_removed	BOOLEAN
    ,description CHAR(6000)
);


-- Videos Rusia
DROP TABLE IF EXISTS DataVideos_Russia;

CREATE TABLE DataVideos_Russia
(
     video_id CHAR(20)
    ,trending_date DATE
    ,title CHAR(100)
    ,channel_title CHAR(100)
    ,category_id INTEGER
    ,publish_time TIMESTAMP(2)
    ,tags CHAR(1000)
    ,views BIGINT
    ,likes BIGINT
    ,dislikes BIGINT
    ,comment_count INTEGER
    ,thumbnail_link	CHAR(100)
    ,comments_disabled BOOLEAN
    ,ratings_disabled BOOLEAN
    ,video_error_or_removed	BOOLEAN
    ,description CHAR(6000)
);



-- Videos EUA
DROP TABLE IF EXISTS DataVideos_USA;

CREATE TABLE DataVideos_USA
(
     video_id CHAR(20)
    ,trending_date DATE
    ,title CHAR(100)
    ,channel_title CHAR(100)
    ,category_id INTEGER
    ,publish_time TIMESTAMP(2)
    ,tags CHAR(1000)
    ,views BIGINT
    ,likes BIGINT
    ,dislikes BIGINT
    ,comment_count INTEGER
    ,thumbnail_link	CHAR(100)
    ,comments_disabled BOOLEAN
    ,ratings_disabled BOOLEAN
    ,video_error_or_removed	BOOLEAN
    ,description CHAR(6000)
);


-- Videos todas las regiones
DROP TABLE IF EXISTS DataVideos_AllRegions;

CREATE TABLE DataVideos_AllRegions
(
     region CHAR(25)
    ,video_id CHAR(20)
    ,trending_date DATE
    ,title CHAR(100)
    ,channel_title CHAR(100)
    ,category CHAR(100)
    ,publish_time TIMESTAMP(2)
    ,tags CHAR(1000)
    ,views BIGINT
    ,likes BIGINT
    ,dislikes BIGINT
    ,comment_count INTEGER
    ,thumbnail_link	CHAR(100)
    ,comments_disabled BOOLEAN
    ,ratings_disabled BOOLEAN
    ,video_error_or_removed	BOOLEAN
    ,description CHAR(6000)
);



-- 'video_id', 'trending_date', 'title', 'channel_title', 'category_id', 'publish_time', 'tags', 'views', 'likes', 'dislikes', 'comment_count', 'thumbnail_link', 'comments_disabled', 'ratings_disabled', 'video_error_or_removed', 'description'
