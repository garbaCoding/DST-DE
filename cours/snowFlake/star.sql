-- ============================================================
-- DIMENSION GENRE
-- ============================================================

CREATE TABLE dim_genre (
    genre_key INTEGER AUTOINCREMENT PRIMARY KEY,
    genre_id INTEGER NOT NULL UNIQUE,
    genre_name VARCHAR(100) NOT NULL,
    genre_description VARCHAR(500)
);

-- ============================================================
-- DIMENSION ARTIST
-- ============================================================

CREATE TABLE dim_artist (
    artist_key INTEGER AUTOINCREMENT PRIMARY KEY,
    artist_id INTEGER NOT NULL UNIQUE,
    artist_name VARCHAR(200) NOT NULL,
    artist_country VARCHAR(100)
);

-- ============================================================
-- DIMENSION CD
-- ============================================================

CREATE TABLE dim_cd (
    cd_key INTEGER AUTOINCREMENT PRIMARY KEY,
    cd_id INTEGER NOT NULL UNIQUE,
    cd_title VARCHAR(200) NOT NULL,
    cd_label VARCHAR(100),
    cd_release_date DATE,
    cd_price NUMBER(10,2),
    artist_key INTEGER NOT NULL,
    FOREIGN KEY (artist_key) REFERENCES dim_artist(artist_key) NOT ENFORCED
);

-- ============================================================
-- DIMENSION TRACK
-- ============================================================

CREATE TABLE dim_track (
    track_key INTEGER AUTOINCREMENT PRIMARY KEY,
    track_id INTEGER NOT NULL UNIQUE,
    track_title VARCHAR(200) NOT NULL,
    track_length INTEGER,
    track_rating INTEGER,
    genre_key INTEGER NOT NULL,
    FOREIGN KEY (genre_key) REFERENCES dim_genre(genre_key) NOT ENFORCED
);

-- ============================================================
-- DIMENSION TIME
-- ============================================================

CREATE TABLE dim_time (
    time_key INTEGER AUTOINCREMENT PRIMARY KEY,
    full_date DATE NOT NULL UNIQUE,
    year INTEGER NOT NULL,
    quarter INTEGER NOT NULL,
    month INTEGER NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    day INTEGER NOT NULL,
    day_of_week INTEGER NOT NULL,
    day_name VARCHAR(20) NOT NULL,
    week_of_year INTEGER NOT NULL
);

-- ============================================================
-- TABLE DE FAITS
-- ============================================================

CREATE TABLE fact_track_cd (
    fact_key INTEGER AUTOINCREMENT PRIMARY KEY,
    track_key INTEGER NOT NULL,
    cd_key INTEGER NOT NULL,
    artist_key INTEGER NOT NULL,
    genre_key INTEGER NOT NULL,
    time_key INTEGER NOT NULL,
    track_position INTEGER,
    -- mesures réelles et non stockées en dimension :
    track_length INTEGER,
    track_rating INTEGER,
    cd_price NUMBER(10,2),

    FOREIGN KEY (track_key) REFERENCES dim_track(track_key) NOT ENFORCED,
    FOREIGN KEY (cd_key) REFERENCES dim_cd(cd_key) NOT ENFORCED,
    FOREIGN KEY (artist_key) REFERENCES dim_artist(artist_key) NOT ENFORCED,
    FOREIGN KEY (genre_key) REFERENCES dim_genre(genre_key) NOT ENFORCED,
    FOREIGN KEY (time_key) REFERENCES dim_time(time_key) NOT ENFORCED
);
