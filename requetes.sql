-- On indique quelle base de données utilisée
USE kiceo;

-- 1a. Afficher la table des horaires dans l’ordre chronologique à l’arrêt Madeleine

-- requête simplifiée car on sait qu'il n'y a qu'une ligne et qu'elle ne circule que le lundi: 
SELECT h.horaire as "Horaires à l'arrêt Madeleine (Lundi)" 
FROM horaire h
INNER JOIN station s ON s.id_station = h.id_station
WHERE s.nom_station = 'Madeleine'
ORDER BY h.horaire;

-- pour avoir une meilleure lisibilité lors de l'affichage du résultat des requêtes dans le terminal
SELECT ''; 

-- 1b. Afficher la table des horaires dans l’ordre chronologique à l’arrêt République
SELECT h.horaire as "Horaires à l'arrêt République (Lundi)" FROM horaire h
INNER JOIN station s ON s.id_station = h.id_station
WHERE s.nom_station = 'République'
ORDER BY h.horaire;

SELECT ''; 

-- 2. Afficher le parcours complet de la ligne 2 Direction Kersec (la liste des arrêts dans l’ordre de passage).
SET sql_mode = ( SELECT REPLACE (@@sql_mode, 'ONLY_FULL_GROUP_BY','' ));
SELECT DISTINCT nom_station as "Parcours de la ligne 2 Direction Kersec"
FROM Station s
INNER JOIN Horaire h ON h.id_station = s.id_station
INNER JOIN Ligne l ON l.id_ligne = h.id_ligne
WHERE l.nom_ligne = 'Direction kersec' 
ORDER BY h.id_horaire;

SELECT ''; 

-- 3. CF schema.sql - Question 5

-- 4. A l’arrêt Petit Tohannic, au lieu d’afficher la table des horaires, afficher le message "Arrêt temporairement non desservi."
SELECT DISTINCT
CASE 
	WHEN est_active = 0  THEN  'Arrêt temporairement non desservi.'
    ELSE 'L\'arrêt est desservi'
    END AS 'Horaires à l\'arrêt Petit Tohannic (Lundi)'
FROM horaire h
INNER JOIN station s ON s.id_station = h.id_station
WHERE s.nom_station = 'Petit Tohannic';

SELECT ''; 

-- 5 Écrire la requête pour mettre à jour l’arrêt Petit Tohannic (a) et la requête pour afficher le message (b):

-- a)Requête pour modifier la colonne est_active à 0 de l'arrêt Petit Tohannic
UPDATE Station
SET est_active = 0
WHERE nom_station = 'Petit Tohannic';

-- b)Requête pour récupérer le prochain arrêt - utilisation de la clause WITH (CTE) qui permet d'aliasser les requêtes et d'effectuer sensiblement une sous-requête:

WITH ProchainArret AS (
    SELECT
        nom_station
    FROM
        Station
    WHERE
        id_station > (
            SELECT id_station
            FROM Station
            WHERE nom_station = 'Petit Tohannic'
        )
    ORDER BY id_station
    LIMIT 1
)

-- Requête pour afficher le message selon l'état de la station
SELECT
    CASE
        WHEN est_active = 0 THEN
           CONCAT("Arrêt temporairement non desservi, veuillez vous reporter à l'\arrêt ", (SELECT nom_station FROM ProchainArret))
        ELSE 'Les stations sont desservies'
    END AS "Horaires à l\'arrêt Petit Tohannic (Lundi)"
FROM
    Station
WHERE
    nom_station = 'Petit Tohannic';

SELECT ''; 

-- 6. cf data.sql

-- 7. Afficher pour chaque ligne, le parcours complet: 
SELECT
    l.nom_ligne AS "Ligne",
    GROUP_CONCAT(DISTINCT s.nom_station ORDER BY h.horaire) AS " Arrêts desservis"
FROM
    Ligne l
INNER JOIN
    Horaire h ON l.id_ligne = h.id_ligne
INNER JOIN
    Station s ON h.id_station = s.id_station
GROUP BY
    l.id_ligne;
