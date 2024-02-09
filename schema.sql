-- Suppression de la base si elle existe
DROP DATABASE IF EXISTS kiceo;

-- création de la base de données en précisant l'encodage
CREATE DATABASE IF NOT EXISTS kiceo
   CHARACTER SET utf8 
   COLLATE utf8_general_ci;


-- utilisation de la base de donnée Kiceo
USE kiceo

-- On supprime les tables si elles sont déjà existantes
DROP TABLE IF EXISTS Associer;
DROP TABLE IF EXISTS Horaire;
DROP TABLE IF EXISTS Jour;
DROP TABLE IF EXISTS Ligne;
DROP TABLE IF EXISTS Station;


-- création des tables + précision moteur et encodage

CREATE TABLE IF NOT EXISTS Station(
      -- définition des colonnes
   id_station INTEGER AUTO_INCREMENT,
   nom_station VARCHAR(50) NOT NULL,
      -- contrainte de clef primaire
   CONSTRAINT pk_station PRIMARY KEY(id_station),
   UNIQUE(nom_station)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS Ligne(
      -- définition des colonnes
   id_ligne INTEGER AUTO_INCREMENT,
   numero_ligne INTEGER NOT NULL,
   nom_ligne VARCHAR(50) NOT NULL,
      -- contrainte de clef primaire
   CONSTRAINT pk_ligne PRIMARY KEY(id_ligne),
   UNIQUE(nom_ligne)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS Jour(
      -- définition des colonnes
   id_jour INTEGER AUTO_INCREMENT,
   nom_jour ENUM('lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi')  NOT NULL,
      -- contrainte de clef primaire
   CONSTRAINT pk_jour PRIMARY KEY(id_jour)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS Horaire(
       -- définition des colonnes
   id_horaire INTEGER AUTO_INCREMENT,
   horaire TIME NOT NULL,
   id_ligne INTEGER NOT NULL,
   id_station INTEGER NOT NULL,
     -- contrainte de clef primaire
   CONSTRAINT pk_horaire PRIMARY KEY(id_horaire),
      -- contraintes de clef étrangère
   CONSTRAINT fk_horaire_ligne FOREIGN KEY(id_ligne) REFERENCES Ligne(id_ligne),
    CONSTRAINT fk_horaire_station FOREIGN KEY(id_station) REFERENCES Station(id_station)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS Associer(
      -- définition des colonnes
   id_horaire INTEGER,
   id_jour INTEGER,
      -- contrainte de clef primaire
   CONSTRAINT pk_associer_jour_horaire PRIMARY KEY(id_horaire, id_jour),
      -- contraintes de clef étrangère
   CONSTRAINT fk_associer_horaire FOREIGN KEY(id_horaire) REFERENCES Horaire(id_horaire),
   CONSTRAINT fk_associer_jour FOREIGN KEY(id_jour) REFERENCES Jour(id_jour)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Question 5: Modification de la table Station pour répondre à la problématique d'une station en travaux. On ajoute un attribut est_active de type booléen, ce qui va permettre définir si la station est en travaux ou non: 

ALTER TABLE station
ADD COLUMN est_active BOOLEAN
AFTER nom_station; 