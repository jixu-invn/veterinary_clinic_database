DROP TABLE IF EXISTS Médicament_autorisé;
DROP TABLE IF EXISTS Traitement_contient;
DROP TABLE IF EXISTS Médicaments;
DROP TABLE IF EXISTS Traitements;
DROP TABLE IF EXISTS Animaux;
DROP TABLE IF EXISTS Espèces;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Vétérinaires;
DROP TABLE IF EXISTS Assistants;
DROP TABLE IF EXISTS Classes_especes_animales;

###Comm: On ajoute AUTO_INCREMENT pour tous les ids?
CREATE TABLE Classes_especes_animales(nom VARCHAR(30) PRIMARY KEY);

CREATE TABLE Assistants
              (id INTEGER PRIMARY KEY ,
              nom VARCHAR(30) NOT NULL,
              prenom VARCHAR(30) NOT NULL,
              naissance date NOT NULL,
              adresse VARCHAR(300),
              tel VARCHAR(14), -- TODO RegEx pour postgres https://www.postgresql.org/docs/current/functions-matching.html#FUNCTIONS-POSIX-REGEXP
              spe VARCHAR(30) NOT NULL,
              UNIQUE(nom,prenom,naissance),
              FOREIGN KEY (spe) REFERENCES Classes_especes_animales(nom)
            );

CREATE TABLE Vétérinaires
              (id INTEGER PRIMARY KEY ,
              nom VARCHAR(30) NOT NULL,
              prenom VARCHAR(30) NOT NULL,
              naissance date NOT NULL,
              adresse VARCHAR(300),
              tel VARCHAR(14), -- TODO RegEx pour postgres https://www.postgresql.org/docs/current/functions-matching.html#FUNCTIONS-POSIX-REGEXP
              spe VARCHAR(30) NOT NULL,
              UNIQUE(nom,prenom,naissance), -- On définit une clé candidate
              FOREIGN KEY (spe) REFERENCES Classes_especes_animales(nom)
            );

CREATE TABLE Clients
              (id INTEGER PRIMARY KEY ,
              nom VARCHAR(30) NOT NULL,
              prenom VARCHAR(30) NOT NULL,
              naissance date NOT NULL,
              adresse VARCHAR(300),
              tel VARCHAR(14), -- TODO RegEx pour postgres https://www.postgresql.org/docs/current/functions-matching.html#FUNCTIONS-POSIX-REGEXP
              UNIQUE(nom,prenom,naissance) -- On définit une clé candidate
            );

CREATE TABLE Espèces(nom VARCHAR(50) PRIMARY KEY, classe VARCHAR(30), FOREIGN KEY (classe) REFERENCES Classes_especes_animales(nom));

CREATE TABLE Animaux
            (id INTEGER PRIMARY KEY ,
            nom VARCHAR(30),
            dernier_poids FLOAT CHECK (dernier_poids>0),
            derniere_taille FLOAT CHECK (derniere_taille>0),
            annee_naissance INTEGER CHECK (ANNEE_NAISSANCE > 1800),
            propriétaire INTEGER NOT NULL,
            espece VARCHAR(50) NOT NULL,
            FOREIGN KEY (espece) REFERENCES Espèces(nom),
            FOREIGN KEY (propriétaire) REFERENCES Clients(id)
          );

CREATE TABLE Traitements(
            id INTEGER PRIMARY KEY,
            nom VARCHAR(100) NOT NULL,
            debut DATE NOT NULL,
            veto INTEGER NOT NULL,
            animal INTEGER NOT NULL,
            FOREIGN KEY (veto) REFERENCES Vétérinaires(id),
            FOREIGN KEY (animal) REFERENCES Animaux(id)
);

CREATE TABLE Médicaments(molécule VARCHAR(50) PRIMARY KEY, description VARCHAR(300) NOT NULL);

CREATE TABLE Traitement_contient (
            traitement INTEGER,
            medicament VARCHAR(50),
            fin DATE NOT NULL,
            quantite_journaliere INTEGER NOT NULL CHECK(quantite_journaliere>0),
            FOREIGN KEY (traitement) REFERENCES Traitements(id),
            FOREIGN KEY (medicament) REFERENCES Médicaments(molécule),
            PRIMARY KEY (traitement, medicament)
          );

CREATE TABLE Médicament_autorisé(
            medicament VARCHAR(50),
            espèce VARCHAR(50),
            FOREIGN KEY (medicament) REFERENCES Médicaments(molécule),
            FOREIGN KEY (espèce) REFERENCES Espèces(nom),
            PRIMARY KEY (medicament, espèce)
          );
