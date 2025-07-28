CREATE TABLE Anime (
  anime_id     INT            PRIMARY KEY,
  english_name VARCHAR(255)   NOT NULL,
  score        DECIMAL(3,2)   NOT NULL,
  type         VARCHAR(50)    NOT NULL,
  episodes     INT,
  aired_start  DATE           NOT NULL,
  aired_end    DATE,
  premiered    VARCHAR(50),
  source       VARCHAR(50),
  duration     VARCHAR(50),
  rating       VARCHAR(50),
  ranked       INT,
  popularity   INT
);
CREATE TABLE Producer (
  producer_name VARCHAR(255) PRIMARY KEY
);
CREATE TABLE Genre (
  genre_name    VARCHAR(100) PRIMARY KEY
);
CREATE TABLE Studio (
  studio_name   VARCHAR(255) PRIMARY KEY
);
CREATE TABLE Classe_Dans (
  anime_id     INT            NOT NULL,
  nom_genre     VARCHAR(100)   NOT NULL,
  PRIMARY KEY (anime_id, nom_genre),
  FOREIGN KEY (anime_id)     REFERENCES Anime(anime_id) ON DELETE CASCADE,
  FOREIGN KEY (nom_genre)     REFERENCES Genre(nom_genre) ON DELETE CASCADE
);
CREATE TABLE A_Comme_Studio (
  anime_id     INT            NOT NULL,
  nom_studio    VARCHAR(255)   NOT NULL,
  PRIMARY KEY (anime_id, nom_studio),
  FOREIGN KEY (anime_id)     REFERENCES Anime(anime_id) ON DELETE CASCADE,
  FOREIGN KEY (nom_studio)    REFERENCES Studio(nom_studio) ON DELETE CASCADE
);
CREATE TABLE Produit_Par (
  anime_id     INT            NOT NULL,
  nom_producer  VARCHAR(255)   NOT NULL,
  PRIMARY KEY (anime_id, nom_producer),
  FOREIGN KEY (anime_id)     REFERENCES Anime(anime_id)    ON DELETE CASCADE,
  FOREIGN KEY (nom_producer)  REFERENCES Producers(nom_producer) ON DELETE CASCADE
);
