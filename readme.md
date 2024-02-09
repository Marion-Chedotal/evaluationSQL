<!-- toc -->

**Table des matières:**
- [**Pré-requis:**](#pré-requis)
- [**Scripts SQL:**](#scripts-sql)
    - [- Implémentation du schéma (schema.sql):](#--implémentation-du-schéma-schemasql)
    - [- Jeu de données (data.sql):](#--jeu-de-données-datasql)
    - [- Requêtes SQL (requetes.sql):](#--requêtes-sql-requetessql)
- [**Conception**:](#conception)
    - [- Dictionnaire des données:](#--dictionnaire-des-données)
    - [- Modèle conceptuelle de données (et modèle logique):](#--modèle-conceptuelle-de-données-et-modèle-logique)
- [**Remarques**](#remarques)
- [**Références**](#références)

<!-- tocstop -->

## **Pré-requis:**

Cloner le dépôt. 
Dans le terminal, effectuer la commande: npm install.
Cela installera la dépendance liée à la génération automatique du TOC (table of contents)

## **Scripts SQL:**

  - Vous trouverez trois scripts sql:
  
  1. schema.sql: Création des tables

  2. data.sql: Insertion du jeu de données

  3. requetes.sql: Requêtes SQL

&nbsp;
   
- Instructions pour lancer les scripts en *Batch Mod*:
  
  *NB: A exécuter directement dans le terminal, et être dans le fichier courant*

  #### - Implémentation du schéma (schema.sql): 
  
  mysql -h localhost -u root -p < schema.sql

  #### - Jeu de données (data.sql):
  mysql -h localhost -u root -p < data.sql

  #### - Requêtes SQL (requetes.sql):
  mysql -h localhost -u root -p < requetes.sql
  
  &nbsp;
  
## **Conception**:

 #### - Dictionnaire des données: 
 

| Attribut         | Type                                                   | Commentaire                       |
| :--------------- |:------------------------------------------------------:| ---------------------------------:|
| id_station       | Integer                                                |  id de la station                 |
| nom_station      | VARCHAR(50)                                            |  nom de la station de bus         |
| est_active       | BOOLEAN                                                |  0: station non-active cela signifie qu'elle est en travaux, 1: active donc desservie.                                                                           |
| id_ligne         | INTEGER                                                |  id de la ligne de bus            |
| numero_ligne     | INTEGER                                                |  numero de la ligne de bus        |
| nom_ligne        | VARCHAR(50)                                            |  nom de la ligne de bus           |
| id_jour          | INTEGER                                                |  id du jour                       |
| nom_jour         | ENUM('lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi')|  Enumération des jours de la semaine (par défaut uniquement le lundi, mais enum pour anticiper un usage futur du schéma)
| id_horaire       | INTEGER                                                |  id de l'horaire                  |
| horaire     | TIME                                                   |  Heure départ / horaire du bus    |

 #### - Modèle conceptuelle de données (et modèle logique):
![MCD](/mcd_kiceo.png)
![MLD](/mld_kiceo.png)

&nbsp;
## **Remarques**
Il n'a pas été évident de trouver un MCD cohérent pour ne pas avoir de données en doublons. J'ai du m'y reprendre à 2 fois.

Concernant la simplification du sujet par rapport au réel, j'ai tout de même indiqué en type de données pour le jour, ENUM afin d'anticiper une modification et un ajout de jour de la semaine. 

Par défaut, comme nous nous limitons au lundi et à la ligne 2, dans mes requêtes, je n'ai pas indiqué de prédicat concernant le jour. 

NB1: pour la réponse à la question 7, ma requête fonctionne sur phpMyadmin. Mais en la lançant dans l'invite de commande, l'arrêt République se retrouve avant dernier sur la ligne Kersec.. 

NB2: réponse à la question 8 sur le pdf. 

&nbsp;
## **Références**
- Vos cours + cours de l'année précédente
- Cours libres de Colibri Strasbourg [colibri.unistra.fr](https://colibri.unistra.fr/)
- Site officiel de mysql: [dev.mysql.com](https://dev.mysql.com/doc/refman/8.0/en/)
- sql.sh: [sql.sh](https://sql.sh/cours)
- Pour les CTE: [developpez.com](https://sgbd.developpez.com/actu/101633/Apprendre-a-utiliser-manipuler-les-CTE-Common-Table-Expression-un-tutoriel-de-Lyche/)