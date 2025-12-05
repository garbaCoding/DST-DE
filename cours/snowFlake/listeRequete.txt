-- 1 - Donnez les titres des albums qui ont plus de 1 CD.
    SELECT
        A.TITLE
    FROM
        ALBUM AS A
    JOIN
        TRACK AS T
        ON A.ALBUMID = T.ALBUMID
    JOIN
        DIM_TRACK AS DT
        ON T.TRACKID = DT.TRACK_ID
    JOIN
        FACT_TRACK_CD AS FTC
        ON DT.TRACK_KEY = FTC.TRACK_KEY
    GROUP BY
        A.ALBUMID, A.TITLE
    HAVING
        COUNT(DISTINCT FTC.CD_KEY) > 1;

-- 2 - Donnez les morceaux produits en 2000 ou en 2002.
    SELECT DISTINCT
        DT.TRACK_TITLE
    FROM
        DIM_TRACK AS DT
    JOIN
        FACT_TRACK_CD AS FTC
        ON DT.TRACK_KEY = FTC.TRACK_KEY
    JOIN
        DIM_TIME AS DTI
        ON FTC.TIME_KEY = DTI.TIME_KEY
    WHERE
        DTI.YEAR = 2000 OR DTI.YEAR = 2002;

-- 3 - Donnez le nom et le compositeur des morceaux de Rock et de Jazz.
    SELECT
        T.NAME AS TrackName,
        T.COMPOSER AS Composer
    FROM
        TRACK AS T
    JOIN
        GENRE AS G
        ON T.GENREID = G.GENREID
    WHERE
        G.NAME = 'Rock' OR G.NAME = 'Jazz';

-- 4 - Donnez les 10 albums les plus longs.
    SELECT
        A.TITLE AS AlbumTitle,
        SUM(T.MILLISECONDS) AS TotalDurationMilliseconds
    FROM
        ALBUM AS A
    JOIN
        TRACK AS T
        ON A.ALBUMID = T.ALBUMID
    GROUP BY
        A.ALBUMID, A.TITLE
    ORDER BY
        TotalDurationMilliseconds DESC
    LIMIT 10;

-- 5 - Donnez le nombre d albums produits pour chaque artiste.

    SELECT
        AR.NAME AS ArtistName,
        COUNT(A.ALBUMID) AS NumberOfAlbums
    FROM
        ARTIST AS AR
    JOIN
        ALBUM AS A
        ON AR.ARTISTID = A.ARTISTID
    GROUP BY
        AR.ARTISTID, AR.NAME
    ORDER BY
        NumberOfAlbums DESC;

-- 6 - Donnez le nombre de morceaux produits par chaque artiste.
    SELECT
        AR.NAME AS ArtistName,
        COUNT(T.TRACKID) AS NumberOfTracks
    FROM
        ARTIST AS AR
    JOIN
        ALBUM AS A
        ON AR.ARTISTID = A.ARTISTID
    JOIN
        TRACK AS T
        ON A.ALBUMID = T.ALBUMID
    GROUP BY
        AR.ARTISTID, AR.NAME
    ORDER BY
        NumberOfTracks DESC;

-- 7 - Donnez le genre de musique le plus écouté dans les années 2000.
    SELECT
        G.NAME AS GenreMusiqueLePlusEcoute,
        COUNT(FTC.TRACK_KEY) AS TotalOccurrencesSurCDs -- Compte le nombre de fois qu'un morceau de ce genre apparaît sur un CD
    FROM
        FACT_TRACK_CD AS FTC
    JOIN
        DIM_TIME AS DT
        ON FTC.TIME_KEY = DT.TIME_KEY
    JOIN
        DIM_TRACK AS DDT -- Utilisation de DDT pour DIM_TRACK afin d'éviter la confusion avec DT (DIM_TIME)
        ON FTC.TRACK_KEY = DDT.TRACK_KEY
    JOIN
        TRACK AS T -- Jointure à la table TRACK opérationnelle pour récupérer le GENREID non présent dans DIM_TRACK
        ON DDT.TRACK_ID = T.TRACKID
    JOIN
        GENRE AS G
        ON T.GENREID = G.GENREID
    WHERE
        DT.YEAR >= 2000 AND DT.YEAR <= 2009
    GROUP BY
        G.NAME
    ORDER BY
        TotalOccurrencesSurCDs DESC
    LIMIT 1;

-- 8 - Donnez les noms de toutes les playlists où figurent des morceaux de plus de 4 minutes.
    SELECT DISTINCT
        P.NAME AS PlaylistName
    FROM
        PLAYLIST AS P
    JOIN
        PLAYLISTTRACK AS PT
        ON P.PLAYLISTID = PT.PLAYLISTID
    JOIN
        TRACK AS T
        ON PT.TRACKID = T.TRACKID
    WHERE
        T.MILLISECONDS > 240000; -- 4 minutes = 240 000 millisecondes

-- 9 - Donnez les morceaux de Rock dont les artistes sont en France.
    SELECT
        T.NAME AS TrackName
    FROM
        TRACK AS T
    JOIN
        ALBUM AS A
        ON T.ALBUMID = A.ALBUMID
    JOIN
        ARTIST AS AR
        ON A.ARTISTID = AR.ARTISTID
    JOIN
        GENRE AS G
        ON T.GENREID = G.GENREID
    WHERE
        G.NAME = 'Rock' AND AR.COUNTRY = 'France';

-- 10 - Donnez la moyenne des tailles des morceaux par genre musical.
    SELECT
        G.NAME AS GenreName,
        AVG(T.MILLISECONDS) AS AverageTrackLengthMilliseconds
    FROM
        TRACK AS T
    JOIN
        GENRE AS G
        ON T.GENREID = G.GENREID
    GROUP BY
        G.NAME;

-- 11 - Donnez les playlist où figurent des morceaux dartistes nés avant 1990.
    SELECT DISTINCT
        P.Name AS PlaylistName
    FROM
        PLAYLIST AS P
    JOIN
        PLAYLISTTRACK AS PT
        ON P.PlaylistId = PT.PlaylistId
    JOIN
        TRACK AS T
        ON PT.TrackId = T.TrackId
    JOIN
        ALBUM AS A
        ON T.AlbumId = A.AlbumId
    JOIN
        ARTIST AS AR
        ON A.ArtistId = AR.ArtistId
    WHERE
        AR.BirthYear < 1990; -- Ou AR.BirthDate < '1990-01-01'













