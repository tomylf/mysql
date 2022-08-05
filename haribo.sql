-- démarrer le serveur
mysql -u root --

-- voir les bases de données
show databases;
+--------------------+
| Database           |
+--------------------+
| entreprise         |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| poles              |
| seconde-sitewp     |
| site wordpress     |
| test               |
| tom                |
+--------------------+

-- créer une base de données SQL nommée haribo 
create database haribo;


show databases;
+--------------------+
| Database           |
+--------------------+
| entreprise         |
| haribo             |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| poles              |
| seconde-sitewp     |
| site wordpress     |
| test               |
| tom                |
+--------------------+



-- Table Stagiaires
create table stagiaire(id int(11) primary key AUTO_INCREMENT not null, prenom varchar(100) not null, yeux varchar(30) NOT null, genre enum('m','f') not null),

-- Table bonbon
create table bonbons (id int(11) primary key AUTO_INCREMENT not null, nom varchar(100) not null, saveur varchar(100) not null ); 

-- Table bonbons mangé par les stagiaires
create table candisplay(id int(11) primary key AUTO_INCREMENT not null, id_bonbon int(11) DEFAULT null, id_stagiaire int(11) DEFAULT null, date_manger date not null, quantite int(11) not null);

-----------------------------------------------------------------------------------------------------------------------------------------------------------

insert into stagiaire(prenom, yeux, genre) values ('henri', 'bleu', 'm'), ('nacime','marron','m'),('nouha','marron','m'),('tom','vert','m'),('kevin','marron','m'),('shaymae','marron','f'),('hafsa','marron','f'),('dominique','vert','m'),('yadaf','marron','m'),('delia','marron','f');

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- INSERT INTO BONBONS
insert into bonbons (nom,saveur) values('dragibus','cola'),('tagada','fraise'),('bams','banane'),('rotaled','reglisse'),('floppys','sucre'),('rainbollows', 'marshmallows'),('bigharri', 'cerise'),('oursor','fruit'),('coco','fruit'),('oeufoplat','fruit'),('flanbotti','caramel');

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- INSERT INTO candisplay

insert into candisplay(id_bonbon, id_stagiaire, date_manger, quantite) values(4, 7, '2022-06-20', 5);

INSERT INTO candisplay(id_bonbon, id_stagiaire, date_manger, quantite) VALUES (1, 1, '2022-06-05', 5),(2, 2, '2022-06-03', 5),(3, 3, '2022-06-04', 5),(5, 4, '2022-06-15', 5),(6, 5, '2022-06-18', 5),
(7, 6, '2022-06-22', 5),(8, 8, '2022-06-25', 5),(9, 9, '2022-06-24', 5),
(10, 10, '2022-06-01', 5),(11, 11, '2022-06-06', 5);


-- Lister les tables de la BDD **haribo**
show tables;
+------------------+
| Tables_in_haribo |
+------------------+
| bonbons          |
| candisplay       |
| stagiaire        |
+------------------+

-- Voir les paramètres de la table *bonbons*
describe bonbons;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int(11)      | NO   | PRI | NULL    | auto_increment |
| nom    | varchar(100) | NO   |     | NULL    |                |
| saveur | varchar(100) | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+

-- Sélectionner tous les champs de tous les enregistrement de la table *stagiaire*
select * from stagiaire;
+----+-----------+--------+-------+
| id | prenom    | yeux   | genre |
+----+-----------+--------+-------+
|  1 | yacine    | marron | m     |
|  2 | henri     | bleu   | m     |
|  3 | nacime    | marron | m     |
|  4 | nouha     | marron | m     |
|  5 | tom       | vert   | m     |
|  6 | kevin     | marron | m     |
|  7 | shaymae   | marron | f     |
|  8 | hafsa     | marron | f     |
|  9 | dominique | vert   | m     |
| 10 | yadaf     | marron | m     |
| 11 | delia     | marron | f     |
+----+-----------+--------+-------+

--  Rajouter un nouveau stagiaire * Niamatullah* en forçant la numérotation de l'id.
insert into stagiaire(prenom, yeux, genre) values(15 'niamatullah_2', 'marron','m');

--  Rajouter un nouveau stagiaire * Niamatullah* sans forcer la numérotation de l'id.
insert into stagiaire values('','theo', 'marron','m');

--Rajouter dans la table bonbons que Theo a mangé 5 tagada le 16 juin
insert into bonbons (nom,saveur) values('tagada','purple');
insert into candisplay values('',12,16,'2022-06-16',5);

-- sélectionner tous les noms des bonbons 
select nom from bonbons;
+-------------+
| nom         |
+-------------+
| dragibus    |
| tagada      |
| bams        |
| rotaled     |
| floppys     |
| rainbollows |
| bigharri    |
| oursor      |
| coco        |
| oeufoplat   |
| flanbotti   |
| tagada      |
+-------------+

-- selectionner tous les nom des bonbons en enlevant les doublons
select distinct nom from bonbons;
+-------------+
| nom         |
+-------------+
| dragibus    |
| tagada      |
| bams        |
| rotaled     |
| floppys     |
| rainbollows |
| bigharri    |
| oursor      |
| coco        |
| oeufoplat   |
| flanbotti   |
+-------------+

-- récupérer les couleurs des yeux des stagiaire (sélectionner plusieurs champs dans une table)
select prenom, yeux from stagiaire;
+---------------+--------+
| prenom        | yeux   |
+---------------+--------+
| yacine        | marron |
| henri         | bleu   |
| nacime        | marron |
| nouha         | marron |
| tom           | vert   |
| kevin         | marron |
| shaymae       | marron |
| hafsa         | marron |
| dominique     | vert   |
| yadaf         | marron |
| delia         | marron |
| niamatullah   | marron |
| niamatullah_2 | marron |
| theo          | marron |
+---------------+--------+

-- récupérer les couleurs des yeux des stagiaire sans les doublons.
select prenom, yeux from stagiaire group by yeux;
+--------+--------+
| prenom | yeux   |
+--------+--------+
| henri  | bleu   |
| yacine | marron |
| tom    | vert   |
+--------+--------+

-- selectionner le stagiaire qui a l'id 5 
select * from stagiaire where id = 5;
+----+--------+------+-------+
| id | prenom | yeux | genre |
+----+--------+------+-------+
|  5 | tom    | vert | m     |
+----+--------+------+-------+

-- selectionner tous les stagiaire qui on les yeux marron 
select * from stagiaire where yeux = 'marron';
+----+---------------+--------+-------+
| id | prenom        | yeux   | genre |
+----+---------------+--------+-------+
|  1 | yacine        | marron | m     |
|  3 | nacime        | marron | m     |
|  4 | nouha         | marron | m     |
|  6 | kevin         | marron | m     |
|  7 | shaymae       | marron | f     |
|  8 | hafsa         | marron | f     |
| 10 | yadaf         | marron | m     |
| 11 | delia         | marron | f     |
| 12 | niamatullah   | marron | m     |
| 15 | niamatullah_2 | marron | m     |
| 16 | theo          | marron | m     |
+----+---------------+--------+-------+

-- sélectionner tous les stagiaires dont l'id est superieur à 8
select * from stagiaire where id > 8;
+----+---------------+--------+-------+
| id | prenom        | yeux   | genre |
+----+---------------+--------+-------+
|  9 | dominique     | vert   | m     |
| 10 | yadaf         | marron | m     |
| 11 | delia         | marron | f     |
| 12 | niamatullah   | marron | m     |
| 15 | niamatullah_2 | marron | m     |
| 16 | theo          | marron | m     |
+----+---------------+--------+-------+

--selectionner tous les stagiaire sauf celui dont l'id est 4
select * from stagiaire where id != 4;
+----+---------------+--------+-------+
| id | prenom        | yeux   | genre |
+----+---------------+--------+-------+
|  1 | yacine        | marron | m     |
|  2 | henri         | bleu   | m     |
|  3 | nacime        | marron | m     |
|  5 | tom           | vert   | m     |
|  6 | kevin         | marron | m     |
|  7 | shaymae       | marron | f     |
|  8 | hafsa         | marron | f     |
|  9 | dominique     | vert   | m     |
| 10 | yadaf         | marron | m     |
| 11 | delia         | marron | f     |
| 12 | niamatullah   | marron | m     |
| 15 | niamatullah_2 | marron | m     |
| 16 | theo          | marron | m     |
+----+---------------+--------+-------+

-- selectionner tous les stagiaires qui ont un id inferieur ou egal à 10;
select * from stagiaire where id >= 10;
+----+---------------+--------+-------+
| id | prenom        | yeux   | genre |
+----+---------------+--------+-------+
| 10 | yadaf         | marron | m     |
| 11 | delia         | marron | f     |
| 12 | niamatullah   | marron | m     |
| 15 | niamatullah_2 | marron | m     |
| 16 | theo          | marron | m     |
+----+---------------+--------+-------+

--selectionner tous les stagiaire e dont l'id est compris entre 7 et 11
select * from stagiaire where id between 7 and 11;
+----+-----------+--------+-------+
| id | prenom    | yeux   | genre |
+----+-----------+--------+-------+
|  7 | shaymae   | marron | f     |
|  8 | hafsa     | marron | f     |
|  9 | dominique | vert   | m     |
| 10 | yadaf     | marron | m     |
| 11 | delia     | marron | f     |
+----+-----------+--------+-------+

-- selectionner les stagiaire dont le prénom commence par un 'd';
select * from stagiaire where prenom like 'd%';
+----+-----------+--------+-------+
| id | prenom    | yeux   | genre |
+----+-----------+--------+-------+
|  9 | dominique | vert   | m     |
| 11 | delia     | marron | f     |
+----+-----------+--------+-------+

-- trier les stagiaires femmes par id décroissant
select * from stagiaire where genre = 'f' order by id desc;
+----+---------+--------+-------+
| id | prenom  | yeux   | genre |
+----+---------+--------+-------+
| 11 | delia   | marron | f     |
|  8 | hafsa   | marron | f     |
|  7 | shaymae | marron | f     |
+----+---------+--------+-------+

-- trier les stagiaire homme par prénom dans l'ordre alphabetique
select * from stagiaire where genre = 'm' order by prenom;
+----+---------------+--------+-------+
| id | prenom        | yeux   | genre |
+----+---------------+--------+-------+
|  9 | dominique     | vert   | m     |
|  2 | henri         | bleu   | m     |
|  6 | kevin         | marron | m     |
|  3 | nacime        | marron | m     |
| 12 | niamatullah   | marron | m     |
| 15 | niamatullah_2 | marron | m     |
|  4 | nouha         | marron | m     |
| 16 | theo          | marron | m     |
|  5 | tom           | vert   | m     |
|  1 | yacine        | marron | m     |
| 10 | yadaf         | marron | m     |
+----+---------------+--------+-------+

-- tier les stagiaires en affichant les femmes en premier et en classant les couleurs des yeux dans l'ordre alphabetique 
select prenom, yeux from stagiaire order by genre ='f' desc, yeux asc;
+---------------+--------+
| prenom        | yeux   |
+---------------+--------+
| hafsa         | marron |
| delia         | marron |
| shaymae       | marron |
| henri         | bleu   |
| niamatullah_2 | marron |
| niamatullah   | marron |
| yadaf         | marron |
| yacine        | marron |
| kevin         | marron |
| nouha         | marron |
| nacime        | marron |
| theo          | marron |
| dominique     | vert   |
| tom           | vert   |
+---------------+--------+

-- limiter l'affichage d'une requête de sélection de tous les stagiaires aux 3 premieres résultats
SELECT * FROM STAGIAIRE LIMIT 3; --ou LIMIT 0,3;
+----+--------+--------+-------+
| id | prenom | yeux   | genre |
+----+--------+--------+-------+
|  1 | yacine | marron | m     |
|  2 | henri  | bleu   | m     |
|  3 | nacime | marron | m     |
+----+--------+--------+-------+

--