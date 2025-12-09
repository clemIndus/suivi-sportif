CREATE DATABASE suivi_sportif;
use suivi_sportif;

CREATE TABLE SPORTIF (
  Id_Sportif INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(50),
  prenom VARCHAR(50),
  mail VARCHAR(100),
  date_naissance DATE,
  niveau VARCHAR(20)
);


CREATE TABLE COACH (
  Id_Coach INT AUTO_INCREMENT PRIMARY KEY,
  nom_coach VARCHAR(50),
  prenom_coach VARCHAR(50),
  mail_coach VARCHAR(100),
  specialite VARCHAR(30),
  experience SMALLINT
);

CREATE TABLE PROGRAMME (
  Id_Programme INT AUTO_INCREMENT PRIMARY KEY,
  Id_Sportif INT,
  Id_Coach INT,
  nom_programme VARCHAR(50),
  duree_programme SMALLINT,
  description TEXT,
  FOREIGN KEY (Id_Sportif) REFERENCES SPORTIF(Id_Sportif),
  FOREIGN KEY (Id_Coach) REFERENCES COACH(Id_Coach)
);

CREATE TABLE OBJECTIF (
  Id_Objectif INT AUTO_INCREMENT PRIMARY KEY,
  Id_Sportif INT,
  type_objectif VARCHAR(50),
  Metrique VARCHAR(30),
  date_debut DATE,
  date_fin DATE,
  status VARCHAR(20),
  FOREIGN KEY (Id_Sportif) REFERENCES SPORTIF(Id_Sportif)
);

CREATE TABLE EXERCICE (
  Id_Exercice INT AUTO_INCREMENT PRIMARY KEY,
  nom_exercice VARCHAR(50),
  groupe_muscle VARCHAR(50),
  type_effort VARCHAR(20)
);

CREATE TABLE SEANCE (
  Id_SEANCE INT AUTO_INCREMENT PRIMARY KEY,
  Id_Sportif INT,
  Id_Programme INT,
  duree_minutes SMALLINT,
  type_seance VARCHAR(30),
  lieu VARCHAR(30),
  date_seance DATETIME,
  FOREIGN KEY (Id_Sportif) REFERENCES SPORTIF(Id_Sportif),
  FOREIGN KEY (Id_Programme) REFERENCES PROGRAMME(Id_Programme)
);

CREATE TABLE SERIE (
  Id_SERIE INT AUTO_INCREMENT PRIMARY KEY,
  Id_SEANCE INT,
  Id_Exercice INT,
  ordre_serie SMALLINT,
  repetitions SMALLINT,
  charge_kg DECIMAL(5,2),
  duree_sec INT,
  FOREIGN KEY (Id_SEANCE) REFERENCES SEANCE(Id_SEANCE),
  FOREIGN KEY (Id_Exercice) REFERENCES EXERCICE(Id_Exercice)
);

INSERT INTO SPORTIF (nom, prenom, mail, date_naissance, niveau) VALUES
('Martin', 'Lucas', 'lucas.martin@example.com', '1995-03-12', 'intermediaire'),
('Durand', 'Sophie', 'sophie.durand@example.com', '1990-07-25', 'avance'),
('Dupont', 'Adam', 'adam.dupont@example.com', '2002-11-03', 'debutant'),
('Moreau', 'Clara', 'clara.moreau@example.com', '1998-01-18', 'intermediaire'),
('Bernard', 'Thomas', 'thomas.bernard@example.com', '1988-09-02', 'avance'),
('Petit', 'Emma', 'emma.petit@example.com', '2001-05-14', 'intermediaire'),
('Roux', 'Nicolas', 'nicolas.roux@example.com', '1993-02-28', 'debutant'),
('Fontaine', 'Julie', 'julie.fontaine@example.com', '1996-07-10', 'avance'),
('Giraud', 'Hugo', 'hugo.giraud@example.com', '1999-11-21', 'intermediaire'),
('Lambert', 'Sarah', 'sarah.lambert@example.com', '2000-04-05', 'debutant');

INSERT INTO COACH (nom_coach, prenom_coach, mail_coach, specialite, experience) VALUES
('Leroy', 'Thomas', 'thomas.leroy@coach.com', 'muscu', 7),
('Bernard', 'Julie', 'julie.bernard@coach.com', 'cardio', 5),
('Rossi', 'Marco', 'marco.rossi@coach.com', 'nutrition', 10),
('Petit', 'Emma', 'emma.petit@coach.com', 'crossfit', 4),
('Morel', 'Antoine', 'antoine.morel@coach.com', 'muscu', 12),
('Gomez', 'Laura', 'laura.gomez@coach.com', 'yoga', 6),
('Dubois', 'Kevin', 'kevin.dubois@coach.com', 'cardio', 3),
('Robin', 'Claire', 'claire.robin@coach.com', 'pilates', 8),
('Marchand', 'Paul', 'paul.marchand@coach.com', 'crossfit', 5),
('Blanc', 'Sophie', 'sophie.blanc@coach.com', 'muscu', 9);

INSERT INTO PROGRAMME (Id_Sportif, Id_Coach, nom_programme, duree_programme, description) VALUES
(1, 1, 'Prépa 10 km', 8, 'Programme pour courir un 10 km.'),
(2, 2, 'Cardio Burn', 6, 'HIIT intensif pour perte de poids.'),
(3, 3, 'Prise de masse', 10, 'Programme musculation full-body.'),
(4, 4, 'Crossfit débutant', 4, 'Séances variées haute intensité.'),
(5, 5, 'Force maximale', 12, 'Objectif amélioration PR sur grands lifts.'),
(6, 6, 'Yoga détente', 6, 'Séances ciblées relaxation et souplesse.'),
(7, 7, 'Cardio performance', 8, 'Amélioration endurance générale.'),
(8, 8, 'Pilates Core', 5, 'Renforcement musculaire profond.'),
(9, 9, 'Crossfit avancé', 8, 'Adapté aux sportifs expérimentés.'),
(10, 10, 'Hypertrophie', 12, 'Programme volume musculaire.');

INSERT INTO OBJECTIF (Id_Sportif, type_objectif, Metrique, date_debut, date_fin, status) VALUES
(1, 'Courir un 10 km', 'distance', '2024-01-01', '2024-04-01', 'en cours'),
(2, 'Perdre 5 kg', 'poids', '2024-02-01', '2024-06-01', 'en cours'),
(3, 'Augmenter squat', 'charge', '2024-03-15', '2024-09-15', 'en cours'),
(4, 'Améliorer cardio', 'vitesse', '2024-01-10', '2024-05-10', 'atteint'),
(5, 'VMA +2 km/h', 'vitesse', '2024-03-01', '2024-07-01', 'en cours'),
(6, 'Perdre 3 kg', 'poids', '2024-02-20', '2024-06-20', 'en cours'),
(7, 'Faire 20 tractions', 'repetitions', '2024-01-05', '2024-04-05', 'en cours'),
(8, 'Gainage 3 min', 'duree', '2024-01-12', '2024-05-12', 'atteint'),
(9, 'Course 5 km', 'distance', '2024-02-15', '2024-04-30', 'en cours'),
(10, 'Augmenter développé couché', 'charge', '2024-03-01', '2024-08-01', 'en cours');

INSERT INTO EXERCICE (nom_exercice, groupe_muscle, type_effort) VALUES
('Squat barre', 'jambes', 'force'),
('Développé couché', 'pectoraux', 'force'),
('Tractions', 'dos', 'force'),
('Course tapis', 'cardio', 'cardio'),
('Burpees', 'full body', 'cardio'),
('Fentes', 'jambes', 'force'),
('Pompes', 'pectoraux', 'force'),
('Rowing barre', 'dos', 'force'),
('Jumping jacks', 'full body', 'cardio'),
('Planche', 'core', 'endurance');

INSERT INTO SEANCE (Id_Sportif, Id_Programme, duree_minutes, type_seance, lieu, date_seance) VALUES
(1, 1, 60, 'course', 'extérieur', '2024-03-10 10:00:00'),
(2, 2, 45, 'HIIT', 'salle', '2024-03-11 18:00:00'),
(3, 3, 70, 'muscu', 'salle', '2024-03-09 17:00:00'),
(4, 4, 40, 'crossfit', 'box', '2024-03-12 19:00:00'),
(5, 5, 55, 'muscu', 'salle', '2024-03-14 16:30:00'),
(6, 6, 50, 'yoga', 'studio', '2024-03-13 09:00:00'),
(7, 7, 65, 'course', 'extérieur', '2024-03-15 08:30:00'),
(8, 8, 45, 'pilates', 'studio', '2024-03-16 11:00:00'),
(9, 9, 75, 'crossfit', 'box', '2024-03-17 10:00:00'),
(10, 10, 80, 'muscu', 'salle', '2024-03-18 17:00:00');

INSERT INTO SERIE (Id_SEANCE, Id_Exercice, ordre_serie, repetitions, charge_kg, duree_sec) VALUES
(3, 1, 1, 8, 80.0, NULL),
(3, 2, 2, 10, 60.0, NULL),
(3, 3, 3, 6, NULL, NULL),
(1, 4, 1, NULL, NULL, 1800),
(2, 5, 1, 15, NULL, 600),
(5, 1, 1, 12, 70.0, NULL),
(5, 6, 2, 10, 40.0, NULL),
(7, 4, 1, NULL, NULL, 3600),
(10, 2, 1, 8, 70.0, NULL),
(10, 7, 2, 20, NULL, NULL);

SHOW TABLES;
DESC SPORTIF;
SELECT * FROM SPORTIF;