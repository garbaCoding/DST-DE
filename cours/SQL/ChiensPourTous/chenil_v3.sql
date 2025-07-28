-- Table structure for table Chiens

DROP TABLE IF EXISTS Chiens;
CREATE TABLE Chiens (
  IdChien serial PRIMARY KEY,
  NomChien varchar(255) DEFAULT NULL,
  RaceChien varchar(255) DEFAULT NULL,
  SexeChien boolean DEFAULT NULL,
  TatoueChien boolean DEFAULT NULL,
  NumTatouageChien int DEFAULT NULL,
  DateNaissanceChien date DEFAULT NULL,
  CouleurPelageChien varchar(255) DEFAULT NULL,
  PrixVente decimal(10,2) DEFAULT NULL,
  DateVente date DEFAULT NULL,
  IdClient int DEFAULT NULL
);

-- Table structure for table Clients

DROP TABLE IF EXISTS Clients;
CREATE TABLE Clients (
  IdClient serial PRIMARY KEY,
  NomClient varchar(255) DEFAULT NULL,
  PrenomClient varchar(255) DEFAULT NULL,
  AdresseClient text,
  TelClient varchar(20) DEFAULT NULL,
  EmailClient varchar(255) DEFAULT NULL
);

-- Dumping data for table Chiens

INSERT INTO Chiens (NomChien, RaceChien, SexeChien, TatoueChien, NumTatouageChien, DateNaissanceChien, CouleurPelageChien, PrixVente, DateVente, IdClient) VALUES 
  ('Wouf','Dalmatien',true,true,55260,'2021-09-24','Blanc',980.00,'2023-08-25',1),
  ('Mentalo','Husky',false,false,NULL,'2017-09-15','Blanc',966.00,'2023-10-25',2),
  ('Maggie','Husky',true,true,99279,'2014-03-27','Brun',883.00,'2022-06-27',3),
  ('Whisky','Rottweiler',true,true,35941,'2020-03-11','Doré',543.00,'2023-02-05',4),
  ('Bibi','Huski',true,true,88123,'2020-10-10','Beige',894.00,NULL,NULL),
  ('Buddy','Labrador',true,false,NULL,'2019-02-05','Rouge',250.00,'2020-01-01',5),
  ('Sophie','Dalmatien',false,false,NULL,'2016-07-01','Doré',644.00,'2022-03-30',5),
  ('Molly','Rottveiler',false,true,38281,'2018-06-16','Gris',NULL,NULL,NULL),
  ('Padbol','Yorkshire',false,false,NULL,'2014-02-27','Blanc et noir',685.00,NULL,NULL),
  ('Buddy','Labrador',true,false,NULL,'2019-02-05','Rouge',847.00,'2023-08-14',6),
  ('Bibi','Poodle',false,false,61006,'2018-06-30','Noir',692.00,'2022-09-28',7),
  ('Bibi','Poodle',false,true,705423,'2010-04-15','Blanc',197.00,'2021-02-22',8),
  ('Whisky','Poodle',true,false,NULL,'2019-09-25','Beige',NULL,NULL,NULL),
  ('Rocky','Chihuahua',true,false,NULL,'2019-06-15','Noir',NULL,NULL,NULL),
  ('Whisky','Husky',true,true,NULL,'2018-09-02','Gris',449.00,'2022-07-28',9),
  ('Duke','Rottweiler',true,false,NULL,'2019-06-13','Noir et blanc',300.00,'2020-01-13',10),
  ('Buddy','Dalmatien',true,false,NULL,'2015-02-13','Brun',410.00,'2023-09-17',11),
  ('Lucy','Fox Terrier',false,false,56352,'2019-10-01','Brun',363.00,'2022-03-14',3),
  ('Whisky','Boxer',true,false,NULL,'2017-08-03','Noir',484.00,'2023-12-01',12),
  ('Dora','Dalmatien',false,true,25536,'2023-07-01','Blanc',1000.00,'2022-03-30',5),
  ('Shrek','Pitbull',true,false,NULL,'2018-09-02','Vert',250.00,'2022-07-28',12);

-- Dumping data for table Clients

INSERT INTO Clients (NomClient, PrenomClient, AdresseClient, TelClient, EmailClient) VALUES 
  ('Moreau','Anne','9 Rue du Cleps,31000,Toulouse,France','0616273216','anne.moreau@orange.fr'),
  ('Mitchell','Eddy','97 Rue de Paris,75020,Paris,France','0158444288','e.mitchell@hotmail.fr'),
  ('Moreau','William','33 Rue de Crimée,75020,Paris,France','0163243007','william.moreau@free.fr'),
  ('Moreau','Lucia','20 Rue de la soif,75010,Paris,France','0142613306','lucia.moreau@orange.fr'),
  ('Johnson','Céline','52 Rue du sac à dos,69008,Lyon,France','0618490352','celine.johnson@gmail.com'),
  ('Thomas','Nathalie','76 Boulevard des Rousses,69002,Lyon,France ','0748072289','jean.martin@gmail.com'),
  ('Martin','Nathalie','102 Avenue Phoque, Paris,France','0176091014','emilie.moreau@free.fr'),
  ('Gonzalez','Anne','49 Avenue de la joie, 06118, Nice, France','0703825524','anne.gonzalez@hotmail.com'),
  ('Hernandez','José','26 rue Chivas, 58010, Donzy, France','0713522885','j.hernandez@gmail.com'),
  ('Hernandez','Samuel','15 rue des Violettes, 75020, Paris, France','0167531477','youyou@hotmail.fr'),
  ('Rorbert','Sophia','43 Rue Désirée, 69025, Lyon, France','0608507445','sophia.robert@gmail.com'),
  ('Hernandez','José','26 rue de la Modération, 58010, Donzy, France','0614523296','j.hernandez2@gmail.com');
