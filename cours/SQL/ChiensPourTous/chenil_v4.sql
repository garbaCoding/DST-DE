-- Table structure for table Chiens

DROP TABLE IF EXISTS Chiens;
CREATE TABLE Chiens (
  IdChien serial PRIMARY KEY,
  NomChien varchar(45) NOT NULL,
  IdRace int DEFAULT NULL,
  SexeChien boolean DEFAULT NULL,
  NumTatouageChien varchar(45) DEFAULT NULL,
  DateNaissanceChien date DEFAULT NULL,
  CouleurPelageChien varchar(45) DEFAULT NULL,
  IdClient int DEFAULT NULL,
  PrixVente decimal(10,0) DEFAULT NULL,
  DateVente date DEFAULT NULL
);

-- Table structure for table Clients

DROP TABLE IF EXISTS Clients;
CREATE TABLE Clients (
  IdClient serial PRIMARY KEY,
  NomClient varchar(45) NOT NULL,
  PrenomClient varchar(45) NOT NULL,
  AdresseClient varchar(45) NOT NULL,
  CpClient varchar(10) NOT NULL,
  VilleClient varchar(60) NOT NULL,
  PaysClient varchar(45) NOT NULL,
  TelClient varchar(45) DEFAULT NULL,
  EmailClient varchar(45) DEFAULT NULL
);

-- Table structure for table Races

DROP TABLE IF EXISTS Races;
CREATE TABLE Races (
  IdRace serial PRIMARY KEY,
  NomRace varchar(45) NOT NULL
);

-- Dumping data for table Chiens

INSERT INTO Chiens (NomChien, IdRace, SexeChien, NumTatouageChien, DateNaissanceChien, CouleurPelageChien, IdClient, PrixVente, DateVente) VALUES 
  ('Wouf',5,true,'55260','2021-09-24','Blanc',1,980,'2023-08-25'),
  ('Mentalo',6,false,NULL,'2017-09-15','Blanc',2,966,'2023-10-25'),
  ('Maggie',6,true,'99279','2014-03-27','Brun',3,883,'2022-06-27'),
  ('Whisky',2,true,'35941','2020-03-11','Doré',4,543,'2023-02-05'),
  ('Bibi',6,true,'88123','2020-10-10','Beige',NULL,894,NULL),
  ('Buddy',4,true,NULL,'2019-02-05','Rouge',5,250,'2020-01-01'),
  ('Sophie',5,false,NULL,'2016-07-01','Doré',5,644,'2022-03-30'),
  ('Molly',2,false,'38281','2018-06-16','Gris',NULL,NULL,NULL),
  ('Padbol',7,false,NULL,'2014-02-27','Blanc et noir',NULL,685,NULL),
  ('Buddy',4,true,NULL,'2019-02-05','Rouge',6,847,'2023-08-14'),
  ('Bibi',8,false,'61006','2018-06-30','Noir',7,692,'2022-09-28'),
  ('Bibi',8,false,'705423','2010-04-15','Blanc',8,197,'2021-02-22'),
  ('Whisky',8,true,NULL,'2019-09-25','Beige',NULL,NULL,NULL),
  ('Rocky',3,true,NULL,'2019-06-15','Noir',NULL,NULL,NULL),
  ('Whisky',6,true,NULL,'2018-09-02','Gris',9,449,'2022-07-28'),
  ('Duke',2,true,NULL,'2019-06-13','Noir et blanc',10,300,'2020-01-13'),
  ('Buddy',5,true,NULL,'2015-02-13','Brun',11,410,'2023-09-17'),
  ('Lucy',9,false,'56352','2019-10-01','Brun',3,363,'2022-03-14'),
  ('Whisky',10,true,NULL,'2017-08-03','Noir',12,484,'2023-12-01'),
  ('Dora',5,false,'25536','2023-07-01','Blanc',5,1000,'2022-03-30'),
  ('Shrek',1,true,NULL,'2018-09-02','Vert',12,250,'2022-07-28');

-- Dumping data for table Clients

INSERT INTO Clients (NomClient, PrenomClient, AdresseClient, CpClient, VilleClient, PaysClient, TelClient, EmailClient) VALUES 
  ('Moreau','Anne','9 Rue du Cleps','31000','Toulouse','France','0616273216','anne.moreau@orange.fr'),
  ('Mitchell','Eddy','97 Rue de Paris','75020','Paris','France','0158444288','e.mitchell@hotmail.fr'),
  ('Moreau','William','33 Rue de Crimée','75020','Paris','France','0163243007','william.moreau@free.fr'),
  ('Moreau','Lucia','20 Rue de la soif','75010','Paris','France','0142613306','lucia.moreau@orange.fr'),
  ('Johnson','Céline','52 Rue du sac à dos','69008','Lyon','France','0618490352','celine.johnson@gmail.com'),
  ('Thomas','Nathalie','76 Boulevard des Rousses','69002','Lyon','France ','0748072289','jean.martin@gmail.com'),
  ('Martin','Nathalie','102 Avenue Phoque','70010','Paris','France','0176091014','emilie.moreau@free.fr'),
  ('Gonzalez','Anne','49 Avenue de la joie','06118','Nice','France','0703825524','anne.gonzalez@hotmail.com'),
  ('Hernandez','José','26 rue Chivas','58010','Donzy','France','0713522885','j.hernandez@gmail.com'),
  ('Hernandez','Samuel','15 rue des Violettes','75020','Paris','France','0167531477','youyou@hotmail.fr'),
  ('Rorbert','Sophia','43 Rue Désirée','69025','Lyon','France','0608507445','sophia.robert@gmail.com'),
  ('Hernandez','José','26 rue de la Modération','58010','Donzy','France','0614523296','j.hernandez2@gmail.com');

-- Dumping data for table Races

INSERT INTO Races (NomRace) VALUES 
  ('Pitbull'),
  ('Rottweiler'),
  ('Chiwawa'),
  ('Labrador'),
  ('Dalmatien'),
  ('Husky'),
  ('Yorkshire'),
  ('Poodle'),
  ('Fox Terrier'),
  ('Boxer');
