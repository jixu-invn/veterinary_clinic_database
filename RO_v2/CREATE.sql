CREATE TYPE TypEspece AS OBJECT
          (nom VARCHAR2(50),
          classe VARCHAR2(30));
/
CREATE TYPE medoc AS OBJECT(molecule VARCHAR(50), qte_jour INTEGER);
/
CREATE TYPE listeMedoc AS TABLE OF medoc;
/
CREATE TYPE TypVeto AS OBJECT(
            id INTEGER PRIMARY KEY ,
            nom VARCHAR(30) NOT NULL,
            prenom VARCHAR(30) NOT NULL,
            naissance date NOT NULL,
            adresse VARCHAR(300),
            tel VARCHAR(10),
            spe VARCHAR(30)
            );
/

CREATE TABLE Classes_especes_animales(nom VARCHAR(30) PRIMARY KEY);

CREATE TABLE Veto OF TypVeto(
            CHECK (REGEXP_LIKE(tel,'[[:digit:]]{10}')),
            UNIQUE(nom,prenom,naissance),
            FOREIGN KEY(spe) REFERENCES Classes_especes_animales(nom)
            );


CREATE TABLE Veto(
            id INTEGER PRIMARY KEY ,
            nom VARCHAR(30) NOT NULL,
            prenom VARCHAR(30) NOT NULL,
            naissance date NOT NULL,
            adresse VARCHAR(300),
            tel VARCHAR(10) CHECK (REGEXP_LIKE(tel,'[[:digit:]]{10}')),
            spe VARCHAR(30),
            UNIQUE(nom,prenom,naissance),
            FOREIGN KEY(spe) REFERENCES Classes_especes_animales(nom)
            );

CREATE TABLE Especes OF TypEspece(
            FOREIGN KEY (classe) REFERENCES Classes_especes_animales(nom)
            );


CREATE TABLE Clients
              (id INTEGER PRIMARY KEY ,
              nom VARCHAR(30) NOT NULL,
              prenom VARCHAR(30) NOT NULL,
              naissance date NOT NULL,
              adresse VARCHAR(300),
              tel VARCHAR(10) CHECK (REGEXP_LIKE(tel,'[[:digit:]]{10}')),
              UNIQUE(nom,prenom,naissance) -- On definit une cle candidate
            );

CREATE TABLE Animaux
            (id INTEGER PRIMARY KEY ,
            nom VARCHAR(30),
            dernier_poids FLOAT CHECK (dernier_poids>0),
            derniere_taille FLOAT CHECK (derniere_taille>0),
            annee_naissance INTEGER CHECK (ANNEE_NAISSANCE > 1800),
            proprietaire INTEGER NOT NULL,
            espece TypEspece NOT NULL,
            FOREIGN KEY (proprietaire) REFERENCES Clients(id)
          );

CREATE TABLE Traitements
          (
            id INTEGER PRIMARY KEY,
            nom VARCHAR(100) NOT NULL,
            debut DATE NOT NULL,
            fin DATE NOT NULL,
            veto INTEGER NOT NULL,
            animal INTEGER NOT NULL,
            medicaments listeMedoc,
            FOREIGN KEY (animal) REFERENCES Animaux(id),
            UNIQUE(veto, debut, animal)
          ) NESTED TABLE medicaments STORE AS tListeMedoc;

COMMIT;