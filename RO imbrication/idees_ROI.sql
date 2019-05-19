composition : 
	espèce compose classe_espèces_animales  ???

CREATE OR REPLACE TYPE espece AS OBJECT(
nom varchar(200) UNIQUE NOT NULL
);
/
CREATE OR REPLACE TYPE liste_espece AS TABLE OF espece;

CREATE TABLE Classe_especes_animales(
nom varchar(200) PRIMARY KEY,
especes liste_espece
);

Que peut-on changer d'autre par rapport au SQL "normal" ?