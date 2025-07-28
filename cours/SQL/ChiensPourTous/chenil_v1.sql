-- Table structure for table Chiens

DROP TABLE IF EXISTS Chiens;
CREATE TABLE Chiens (
  NomChien varchar(255) DEFAULT NULL,
  RaceChien varchar(255) DEFAULT NULL,
  SexeChien varchar(10) DEFAULT NULL,
  TatoueChien varchar(3) DEFAULT NULL,
  NumTatouageChien int DEFAULT NULL,
  DateNaissanceChien date DEFAULT NULL,
  CouleurPelageChien varchar(255) DEFAULT NULL,
  NomClient varchar(255) DEFAULT NULL,
  PrenomClient varchar(255) DEFAULT NULL,
  AdresseClient text,
  TelClient varchar(20) DEFAULT NULL,
  EmailClient varchar(255) DEFAULT NULL,
  PrixVente decimal(10,2) DEFAULT NULL,
  DateVente date DEFAULT NULL
);

-- Dumping data for table Chiens

INSERT INTO Chiens VALUES 
  ('Wouf','Dalmatien','male','oui',55260,'2021-09-24','Blanc','Moreau','Anne','9 Rue du Cleps, 31000, Toulouse, France','0616273216','anne.moreau@orange.fr',980.00,'2023-08-25'),
  ('Mentalo','Husky','Femelle','non',NULL,'2017-09-15','Blanc','Mitchell','Eddy','97 Rue de Paris, 75020, Paris, France','0158444288','e.mitchell@hotmail.fr',966.00,'2023-10-25'),
  ('Maggie','Husky','mâle','oui',99279,'2014-03-27','Brun','Moreau','William','33 Rue de Crimée, 75020, Paris, France','0163243007','william.moreau@free.fr',883.00,'2022-06-27'),
  ('Whisky','Rottweiler','Maal','oui',35941,'2020-03-11','Doré','Moreau','Lucía','20 Rue de la Soif, 75010, Paris, France','0142613306','lucia.moreau@orange.fr',543.00,'2023-02-05'),
  ('Bibi','Huski','mâle','oui',88123,'2020-10-10','Beige',NULL,NULL,NULL,NULL,NULL,894.00,NULL),
  ('Buddy','Labrador','mâle','non',NULL,'2019-02-05','Rouge','Johnson','Céline','52 Rue des Pins, 35010, Rennes, France','0618490352','celine.johnson@gmail.com',250.00,'2020-01-01'),
  ('Rasta','Dalmatien','femelle','non',NULL,'2016-07-01','Doré','Johnson','Céline','52 Impasse du Coiffeur, 69008, Lyon, France','0618490352','celine.johnson@gmail.com',644.00,'2022-03-30'),
  ('Molly','Rottweiler','femele','oui',38281,'2018-06-16','Gris',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  ('Padbol','Yorkshire','femelle','non',NULL,'2014-02-27','Blanc et noir','','','','','',685.00,NULL),
  ('Buddy','Labrador','mâle','non',NULL,'2019-02-05','Rouge','Thomas','Nathalie','76 Boulevard des Rousses, 69002, Lyon, France','0748072289','jean.martin@gmail.com',847.00,'2023-08-14'),
  ('Bibi','Poodle','femelle','non',61006,'2018-06-30','Noir','Martin','Nathalie','102 Avenue Phoque, 75020, Paris, France','0176091014','emilie.moreau@free.fr',692.00,'2022-09-28'),
  ('Bibi','Poodle','femelle','oui',705423,'2010-04-15','Blanc','Gonzalez','Anne','49 Avenue de la Joie, 06118, Nice, France','0703825524','anne.gonzalez@hotmail.com',197.00,'2021-02-22'),
  ('Whisky','Poodle','mâlle','non',NULL,'2019-09-25','Beige',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  ('Rocky','Chihuahua','mâle','non',NULL,'2019-06-15','Noir',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  ('Whisky','Husky','mâle','oui',NULL,'2018-09-02','Gris','Hernandez','José','26 rue Chivas, 58010, Donzy, France','0612420138','j.hernandez@@gmail.com',449.00,'2022-07-28'),
  ('Duke','Rottweiler','mâle','non',NULL,'2019-06-13','Noir et blanc','Hernandez','samuel','15 rue des Violettes, 75020, Paris, France','0167531477','youyou@hotmail.fr',300.00,'2020-01-13'),
  ('Buddy','Dalmatien','mâle','non',NULL,'2015-02-13','Brun','Robert','Sofía','43 Rue Désirée, 69025, Lyon, France','0608507445','sofia.robert@gmail.com',410.00,'2023-09-17'),
  ('Lucy','Fox terrier','femelle','non',56352,'2019-10-01','Brun','Moreau','William','88 Boulevard Debouchage, 06000, Nice, France','0629039017','william.moreau@gmail.com',363.00,'2022-03-14'),
  ('Whisky','Boxer','mâle','non',NULL,'2017-08-03','Noir','Hernandez','José','26 rue de la Modération, 58010, Donzy, France','0713522885','j.hernandez@gmail.com',484.00,'2022-12-01'),
  ('Dora','Dalmatien','femelle','oui',25536,'2023-07-01','Blanc','Johnson','Céline','52 rue du sac à dos, 69001, Lyon, France','0618490352','celine.johnson@gmail.com',1000.00,'2022-03-30');
