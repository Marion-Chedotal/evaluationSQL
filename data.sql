-- On indique sur quelle base les données vont être insérées
USE kiceo

-- On vide les tables
DELETE FROM Associer;
DELETE FROM Horaire;
DELETE FROM Ligne;
DELETE FROM Station;
DELETE FROM Jour;

-- Insertion des données dans la table station en précisant l'encodage pour ne pas avoir de problèmes d'accent
SET NAMES utf8;
INSERT INTO Station(id_station, nom_station) VALUES(1, 'P+R Ouest'),
(2, 'Fourchêne 1'),
(3, 'Madeleine'),
(4, 'République'),
(5, 'PIBS 2'),
(6, 'Petit Tohannic'),
(7, 'Delestraint'),
(8, 'Kersec');

-- Insertion des données dans la table Ligne
INSERT INTO Ligne(id_ligne, numero_ligne, nom_ligne) VALUES (1, 2, 'Direction Kersec');

-- Insertion des données dans la table Jour
INSERT INTO Jour(id_jour, nom_jour) VALUES (1, 'lundi');

-- Insertion des données dans la table Horaire
INSERT INTO Horaire(id_horaire, horaire, id_ligne, id_station) VALUES (1, '06:32:00', 1, 1),
(2, '06:42:00', 1, 1),
(3, '06:52:00', 1, 1),
(4, '07:00:00', 1, 1),
(5, '07:10:00', 1, 1),
(6, '06:34:00', 1, 2),
(7, '06:44:00', 1, 2),
(8, '06:54:00', 1, 2),
(9, '07:02:00', 1, 2),
(10, '07:12:00', 1, 2),
(11, '06:37:00', 1, 3),
(12, '06:47:00', 1, 3),
(13, '06:57:00', 1, 3),
(14, '07:06:00', 1, 3),
(15, '07:16:00', 1, 3),
(16, '06:42:00', 1, 4),
(17, '06:52:00', 1, 4),
(18, '07:02:00', 1, 4),
(19, '07:12:00', 1, 4),
(20, '07:22:00', 1, 4),
(21, '06:46:00', 1, 5),
(22, '06:56:00', 1, 5),
(23, '07:07:00', 1, 5),
(24, '07:17:00', 1, 5),
(25, '07:27:00', 1, 5),
(26, '06:50:00', 1, 6),
(27, '07:00:00', 1, 6),
(28, '07:11:00', 1, 6),
(29, '07:21:00', 1, 6),
(30, '07:31:00', 1, 6),
(31, '06:51:00', 1, 7),
(32, '07:01:00', 1, 7),
(33, '07:12:00', 1, 7),
(34, '07:22:00', 1, 7),
(35, '07:32:00', 1, 7),
(36, '06:55:00', 1, 8),
(37, '08:05:00', 1, 8),
(38, '07:16:00', 1, 8),
(39, '07:26:00', 1, 8),
(40, '07:36:00', 1, 8);

-- Insertion des données dans la table associer
INSERT INTO associer(id_horaire, id_jour) VALUES (1,1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1);

-- 6. Ajouter la ligne 2 Direction P+R Ouest

-- Insertion de la nouvelle ligne
INSERT INTO Ligne (id_ligne, numero_ligne, nom_ligne) VALUES(2, 2, 'Direction P+R Ouest');

-- insertion des horaires de la nouvelle ligne
INSERT INTO Horaire(id_horaire, horaire, id_ligne, id_station) VALUES (41, '06:32:00', 2, 8),
(42, '06:34:00', 2, 7),
(43, '06:37:00', 2, 6),
(44, '06:42:00', 2, 5),
(45, '06:46:00', 2, 4),
(46, '06:50:00', 2, 3),
(47, '06:51:00', 2, 2),
(48, '06:55:00', 2, 1);