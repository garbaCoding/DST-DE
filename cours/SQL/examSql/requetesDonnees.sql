BEGIN;

INSERT INTO Anime
  (anime_id, english_name, score, type, episodes,
   aired_start, aired_end, premiered,
   source, duration, rating, ranked, popularity)
VALUES
  (1, 
  "Cowboy Bebop",
  8.78, 
  "TV", 
  "26, Apr 3, 1998"
  "Apr 24, 1999",
  "Spring 1998",  
  "Original", 
  "24 min. per ep", 
  "R - 17+ (violence & profanity)", 
  28.0, 
  39
  );

INSERT INTO Producer (nom_producer) VALUES
  ('Bandai Visual')
ON CONFLICT DO NOTHING;

INSERT INTO Genre (nom_genre) VALUES
  ('Action'),
  ('Adventure'),
  ('Drama'),
  ('Sci-Fi'),
  ('Space')
ON CONFLICT DO NOTHING;

INSERT INTO Studio (nom_studio) VALUES
  ('Sunrise')
ON CONFLICT DO NOTHING;

INSERT INTO Produit_Par (anime_id, nom_producer) VALUES
  (1, 'Bandai Visual');

INSERT INTO Classe_Dans (anime_id, nom_genre) VALUES
  (1, 'Action'),
  (1, 'Adventure'),
  (1, 'Drama'),
  (1, 'Sci-Fi'),
  (1, 'Space');

INSERT INTO A_Comme_Studio (anime_id, nom_studio) VALUES
  (1, 'Sunrise');

INSERT INTO Anime
  (anime_id, english_name, score, type, episodes,
   aired_start, aired_end, premiered,
   source, duration, rating, ranked, popularity)
VALUES
  (2, 
  "Cowboy Bebop:The Movie",
  8.39,
  "Movie",
  "1, Sep 1, 2001",
  NULL,
  "Original",
  "1 hr. 55 min.",
  "R - 17+ (violence & profanity)",
  159.0,
  518
  );

INSERT INTO Producer (nom_producer) VALUES
  ('Sunrise'),
  ('Bandai Visual')
ON CONFLICT DO NOTHING;

INSERT INTO Genre (nom_genre) VALUES
  ('Action'),
  ('Drama'),
  ('Sci-Fi'),
  ('Space')
ON CONFLICT DO NOTHING;

INSERT INTO Studio (nom_studio) VALUES
  ('Bones')
ON CONFLICT DO NOTHING;

INSERT INTO Produit_Par (anime_id, nom_producer) VALUES
  (2, 'Sunrise'),
  (2, 'Bandai Visual');

INSERT INTO Classe_Dans (anime_id, nom_genre) VALUES
  (2, 'Action'),
  (2, 'Drama'),
  (2, 'Sci-Fi'),
  (2, 'Space');

INSERT INTO A_Comme_Studio (anime_id, nom_studio) VALUES
  (2, 'Bones');





INSERT INTO Anime
  (anime_id, english_name, score, type, episodes,
   aired_start, aired_end, premiered,
   source, duration, rating, ranked, popularity)
VALUES
  (3, 
  'Naruto', 
  7.91,  
  'TV', 
  220, 
  'Oct 3, 2002',
  'Feb 8, 2007', 
  'Fall 2002',  
  'Manga', 
  '23 min. per ep.', 
  'PG-13 - Teens 13 or older', 
  660.0, 
  8
  );

INSERT INTO Producer (nom_producer) VALUES
  ('TV Tokyo'),
  ('Shueisha')
ON CONFLICT DO NOTHING;

INSERT INTO Genre (nom_genre) VALUES
  ('Action'),
  ('Adventure'),
  ('Shounen'),
ON CONFLICT DO NOTHING;

INSERT INTO Studio (nom_studio) VALUES
  ('Studio Pierrot')
ON CONFLICT DO NOTHING;

INSERT INTO Produit_Par (anime_id, nom_producer) VALUES
  (3, 'TV Tokyo'),
  (3, 'Shueisha');

INSERT INTO Classe_Dans (anime_id, nom_genre) VALUES
  (3, 'Action'),
  (3, 'Adventure'),
  (3, 'Shounen');

INSERT INTO A_Comme_Studio (anime_id, nom_studio) VALUES
  (3, 'Studio Pierrot');

INSERT INTO Anime
  (anime_id, english_name, score, type, episodes,
   aired_start, aired_end, premiered,
   source, duration, rating, ranked, popularity)
VALUES
  (4, 
  'One Piece', 
  8.52,  
  'TV', 
  'Oct 20, 1999',
  NULL, 
  'Fall 1999',
  'Manga', 
  '24 min.', 
  'PG-13 - Teens 13 or older', 
  95.0, 
  31
  );

INSERT INTO Producer (nom_producer) VALUES
  ('Fuji TV'),
  ('Shueisha'),
ON CONFLICT DO NOTHING;

INSERT INTO Genre (nom_genre) VALUES
  ('Action'),
  ('Adventure'),
  ('Shounen'),
ON CONFLICT DO NOTHING;

INSERT INTO Studio (nom_studio) VALUES
  ('Toei Animation')
ON CONFLICT DO NOTHING;

INSERT INTO Produit_Par (anime_id, nom_producer) VALUES
  (4, 'Fuji TV'),
  (4, 'Shueisha');

INSERT INTO Classe_Dans (anime_id, nom_genre) VALUES
  (4, 'Action'),
  (4, 'Adventure'),
  (4, 'Shounen');

INSERT INTO A_Comme_Studio (anime_id, nom_studio) VALUES
  (4, 'Toei Animation');

INSERT INTO Anime
  (anime_id, english_name, score, type, episodes,
   aired_start, aired_end, premiered,
   source, duration, rating, ranked, popularity)
VALUES
  (5, 
  'Mobile Suit Gundam SEED', 
  7.79,  
  'TV', 
  50, 
  'Oct 5, 2002',
  'Sep 27, 2003', 
  'Fall 2002',  
  'Original', 
  '24 min. per ep.', 
  'R - 17+ (violence & profanity)', 
  850.0, 
  1057
  );

INSERT INTO Producer (nom_producer) VALUES
  ('Sotsu'),
  ('Sony Music Entertainment'),
ON CONFLICT DO NOTHING;

INSERT INTO Genre (nom_genre) VALUES
  ('Action'),
  ('Drama'),
  ('Military'),
  ('Sci-Fi'),
  ('Space')
ON CONFLICT DO NOTHING;

INSERT INTO Studio (nom_studio) VALUES
  ('Sunrise')
ON CONFLICT DO NOTHING;

INSERT INTO Produit_Par (anime_id, nom_producer) VALUES
  (5, 'Sotsu'),
  (5, 'Sony Music Entertainment');

INSERT INTO Classe_Dans (anime_id, nom_genre) VALUES
  (5, 'Action'),
  (5, 'Drama'),
  (5, 'Military'),
  (5, 'Sci-Fi'),
  (5, 'Space');

INSERT INTO A_Comme_Studio (anime_id, nom_studio) VALUES
  (5, 'Sunrise');


INSERT INTO Anime
  (anime_id, english_name, score, type, episodes,
   aired_start, aired_end, premiered,
   source, duration, rating, ranked, popularity)
VALUES
  (6, 
  'Mobile Suit Gundam SEED Destiny', 
  7.22,  
  'TV', 
  50, 
  'Oct 9, 2004',
  'Oct 1, 2005', 
  'Fall 2004',  
  'Original', 
  '24 min. per ep.', 
  'R - 17+ (violence & profanity)',
  2687.0, 
  1530
  );

INSERT INTO Producer (nom_producer) VALUES
  ('Sotsu'),
  ('Sony Music Entertainment'),
ON CONFLICT DO NOTHING;

INSERT INTO Genre (nom_genre) VALUES
  ('Action'),
  ('Drama'),
  ('Military'),
  ('Sci-Fi'),
  ('Space')
ON CONFLICT DO NOTHING;

INSERT INTO Studio (nom_studio) VALUES
  ('Sunrise')
ON CONFLICT DO NOTHING;

INSERT INTO Produit_Par (anime_id, nom_producer) VALUES
  (6, 'Sotsu'),
  (6, 'Sony Music Entertainment');

INSERT INTO Classe_Dans (anime_id, nom_genre) VALUES
  (6, 'Action'),
  (6, 'Drama'),
  (6, 'Military'),
  (6, 'Sci-Fi'),
  (6, 'Space');

INSERT INTO A_Comme_Studio (anime_id, nom_studio) VALUES
  (6, 'Sunrise');

COMMIT;