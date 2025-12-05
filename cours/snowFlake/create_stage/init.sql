-- ========================================
-- Création des tables
-- ========================================

-- Table Genre
CREATE TABLE Genre (
    GenreId NUMERIC PRIMARY KEY,
    Name VARCHAR
);

-- Table MediaType
CREATE TABLE MediaType (
    MediaTypeId NUMERIC PRIMARY KEY,
    Name VARCHAR
);

-- Table Artist
CREATE TABLE Artist (
    ArtistId NUMERIC PRIMARY KEY,
    Name VARCHAR,
    Birthyear NUMERIC,
    Country VARCHAR
);

-- Table Album
CREATE TABLE Album (
    AlbumId NUMERIC PRIMARY KEY,
    Title VARCHAR,
    ArtistId NUMERIC,
    Prod_year NUMERIC,
    Cd_year NUMERIC,
    FOREIGN KEY (ArtistId) REFERENCES Artist(ArtistId)
);

-- Table Playlist
CREATE TABLE Playlist (
    PlaylistId NUMERIC PRIMARY KEY,
    Name VARCHAR
);

-- Table Track
CREATE TABLE Track (
    TrackId NUMERIC PRIMARY KEY,
    Name VARCHAR,
    MediaTypeId NUMERIC,
    GenreId NUMERIC,
    AlbumId NUMERIC,
    Composer VARCHAR,
    Milliseconds NUMERIC,
    Bytes NUMERIC,
    UnitPrice NUMERIC,
    FOREIGN KEY (MediaTypeId) REFERENCES MediaType(MediaTypeId),
    FOREIGN KEY (GenreId) REFERENCES Genre(GenreId),
    FOREIGN KEY (AlbumId) REFERENCES Album(AlbumId)
);

-- Table PlaylistTrack (table de liaison many-to-many)
CREATE TABLE PlaylistTrack (
    PlaylistId NUMERIC,
    TrackId NUMERIC,
    PRIMARY KEY (PlaylistId, TrackId),
    FOREIGN KEY (PlaylistId) REFERENCES Playlist(PlaylistId),
    FOREIGN KEY (TrackId) REFERENCES Track(TrackId)
);

-- ========================================
-- Vérification des tables créées
-- ========================================
SHOW TABLES;

-- ========================================
-- Peuplement des tables depuis S3
-- ========================================

-- Copie des données Genre
COPY INTO Genre
FROM @s3_data/music/Genre
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1 ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE)
ON_ERROR = 'CONTINUE';

-- Copie des données MediaType
COPY INTO MediaType
FROM @s3_data/music/MediaType
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1 ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE)
ON_ERROR = 'CONTINUE';

-- Copie des données Artist
COPY INTO Artist
FROM @s3_data/music/Artist
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1 ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE)
ON_ERROR = 'CONTINUE';

-- Copie des données Album
COPY INTO Album
FROM @s3_data/music/Album
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1 ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE)
ON_ERROR = 'CONTINUE';

-- Copie des données Playlist
COPY INTO Playlist
FROM @s3_data/music/Playlist
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1 ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE)
ON_ERROR = 'CONTINUE';

-- Copie des données Track
COPY INTO Track
FROM @s3_data/music/Track
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1 ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE)
ON_ERROR = 'CONTINUE';

-- Copie des données PlaylistTrack
COPY INTO PlaylistTrack
FROM @s3_data/music/PlaylistTrack
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1 ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE)
ON_ERROR = 'CONTINUE';

-- ========================================
-- Vérification des données chargées
-- ========================================
SELECT 'Genre' as TABLE_NAME, COUNT(*) as ROW_COUNT FROM Genre
UNION ALL
SELECT 'MediaType', COUNT(*) FROM MediaType
UNION ALL
SELECT 'Artist', COUNT(*) FROM Artist
UNION ALL
SELECT 'Album', COUNT(*) FROM Album
UNION ALL
SELECT 'Playlist', COUNT(*) FROM Playlist
UNION ALL
SELECT 'Track', COUNT(*) FROM Track
UNION ALL
SELECT 'PlaylistTrack', COUNT(*) FROM PlaylistTrack;
