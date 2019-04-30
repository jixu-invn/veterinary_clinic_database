DROP VIEW IF EXISTS STATISTIQUES_ANIMAUX;
DROP VIEW IF EXISTS STATISTIQUES_GLOBALES_MEDICAMENTS;
DROP VIEW IF EXISTS vIndividu;
DROP VIEW IF EXISTS vPersonnel;

DROP TABLE IF EXISTS Medicament_autorise;
DROP TABLE IF EXISTS Traitement_contient;
DROP TABLE IF EXISTS Medicaments;
DROP TABLE IF EXISTS Traitements;
DROP TABLE IF EXISTS Animaux;
DROP TABLE IF EXISTS Especes;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Veterinaires;
DROP TABLE IF EXISTS Assistants;
DROP TABLE IF EXISTS Classes_especes_animales;

CREATE TABLE Classes_especes_animales(nom VARCHAR(30) PRIMARY KEY);

CREATE TABLE Assistants
              (id INTEGER PRIMARY KEY ,
              nom VARCHAR(30) NOT NULL,
              prenom VARCHAR(30) NOT NULL,
              naissance date NOT NULL,
              adresse VARCHAR(300),
              tel VARCHAR(10) CHECK (tel ~ '[[:digit:]]{10}'),
              spe VARCHAR(30) NOT NULL,
              UNIQUE(nom,prenom,naissance),
              FOREIGN KEY (spe) REFERENCES Classes_especes_animales(nom)
            );

CREATE TABLE Veterinaires
              (id INTEGER PRIMARY KEY ,
              nom VARCHAR(30) NOT NULL,
              prenom VARCHAR(30) NOT NULL,
              naissance date NOT NULL,
              adresse VARCHAR(300),
              tel VARCHAR(10) CHECK (tel ~ '[[:digit:]]{10}'),
              spe VARCHAR(30) NOT NULL,
              UNIQUE(nom,prenom,naissance), -- On definit une cle candidate
              FOREIGN KEY (spe) REFERENCES Classes_especes_animales(nom)
            );

CREATE TABLE Clients
              (id INTEGER PRIMARY KEY ,
              nom VARCHAR(30) NOT NULL,
              prenom VARCHAR(30) NOT NULL,
              naissance date NOT NULL,
              adresse VARCHAR(300),
              tel VARCHAR(10) CHECK (tel ~ '[[:digit:]]{10}'),
              UNIQUE(nom,prenom,naissance) -- On definit une cle candidate
            );

CREATE TABLE Especes(nom VARCHAR(50) PRIMARY KEY, classe VARCHAR(30), FOREIGN KEY (classe) REFERENCES Classes_especes_animales(nom));

CREATE TABLE Animaux
            (id INTEGER PRIMARY KEY ,
            nom VARCHAR(30),
            dernier_poids FLOAT CHECK (dernier_poids>0),
            derniere_taille FLOAT CHECK (derniere_taille>0),
            annee_naissance INTEGER CHECK (ANNEE_NAISSANCE > 1800),
            proprietaire INTEGER NOT NULL,
            espece VARCHAR(50) NOT NULL,
            FOREIGN KEY (espece) REFERENCES Especes(nom),
            FOREIGN KEY (proprietaire) REFERENCES Clients(id)
          );

CREATE TABLE Traitements(
            id INTEGER PRIMARY KEY,
            nom VARCHAR(100) NOT NULL,
            debut DATE NOT NULL,
            veto INTEGER NOT NULL,
            animal INTEGER NOT NULL,
            FOREIGN KEY (veto) REFERENCES Veterinaires(id),
            FOREIGN KEY (animal) REFERENCES Animaux(id),
            UNIQUE(veto, debut, animal)
);

CREATE TABLE Medicaments(molecule VARCHAR(50) PRIMARY KEY, description VARCHAR(300) NOT NULL);

CREATE TABLE Traitement_contient (
            traitement INTEGER,
            medicament VARCHAR(50),
            fin DATE NOT NULL,
            quantite_journaliere INTEGER NOT NULL CHECK(quantite_journaliere>0),
            FOREIGN KEY (traitement) REFERENCES Traitements(id),
            FOREIGN KEY (medicament) REFERENCES Medicaments(molecule),
            PRIMARY KEY (traitement, medicament)
          );

CREATE TABLE Medicament_autorise(
            medicament VARCHAR(50),
            espece VARCHAR(50),
            FOREIGN KEY (medicament) REFERENCES Medicaments(molecule),
            FOREIGN KEY (espece) REFERENCES Especes(nom),
            PRIMARY KEY (medicament, espece)
          );
          
CREATE VIEW vPersonnel AS
SELECT * FROM(SELECT  nom,prenom,naissance,adresse,tel,spe FROM Assistants UNION SELECT nom,prenom,naissance,adresse,tel,spe FROM Veterinaires) Personnel;

CREATE VIEW vIndividu AS
SELECT * FROM((SELECT nom,prenom,naissance,adresse,tel FROM Assistants UNION SELECT nom,prenom,naissance,adresse,tel FROM Veterinaires) UNION SELECT nom,prenom,naissance,adresse,tel FROM Clients) Indiv;