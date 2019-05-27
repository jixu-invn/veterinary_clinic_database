CREATE TYPE TypEspece AS OBJECT
          (nom VARCHAR(50),
          classe VARCHAR(30));
/
CREATE TYPE listeEspecesAutorisees AS TABLE OF REF TypEspece;
/
CREATE TYPE TypMedoc AS OBJECT(molecule VARCHAR(50), description VARCHAR(200), especesAutorisees listeEspecesAutorisees);
/
CREATE TYPE listeMedoc AS TABLE OF REF TypMedoc;
/
CREATE TYPE Individu AS OBJECT (
    nom VARCHAR(30),
    prenom VARCHAR(30),
    naissance date,
    adresse VARCHAR(300),
    tel VARCHAR(10)
) NOT FINAL;
/
CREATE TYPE TypVeto UNDER Individu(
            spe VARCHAR(30)
            );
/
CREATE TYPE TypAssistant UNDER Individu(
            spe VARCHAR(30)
            );
/
CREATE TYPE TypTraitement AS OBJECT(
            id INTEGER,
            nom VARCHAR(100),
            debut DATE,
            fin DATE,
            veto INTEGER,
            animal INTEGER,
            medicaments listeMedoc,
            veto TypVeto
            );
/
CREATE TYPE ListeTraitement AS TABLE OF TypTraitement;
/
CREATE TYPE TypAnimal AS OBJECT(
            nom VARCHAR(30),
            dernier_poids FLOAT,
            derniere_taille FLOAT,
            annee_naissance INTEGER,
            proprietaire INTEGER,
            espece VARCHAR(50),
            TraitementsPrescrits ListeTraitement
          );
/
CREATE TYPE listeAnimaux AS TABLE OF REF TypAnimal;
/



CREATE TABLE Classes_especes_animales(nom VARCHAR(30) PRIMARY KEY);

CREATE TABLE Veto OF TypVeto(
            nom NOT NULL,
            prenom NOT NULL,
            naissance NOT NULL,
            CHECK (REGEXP_LIKE(tel,'[[:digit:]]{10}')),
            UNIQUE(nom,prenom,naissance),
            FOREIGN KEY(spe) REFERENCES Classes_especes_animales(nom)
            );

CREATE TABLE Assistants OF TypAssistant(
            nom NOT NULL,
            prenom NOT NULL,
            naissance NOT NULL,
            CHECK (REGEXP_LIKE(tel,'[[:digit:]]{10}')),
            UNIQUE(nom,prenom,naissance),
            FOREIGN KEY(spe) REFERENCES Classes_especes_animales(nom)
            );

CREATE TABLE Especes OF TypEspece(
            FOREIGN KEY (classe) REFERENCES Classes_especes_animales(nom)
            );
            
            
CREATE TABLE Medoc OF TypMedoc(
            PRIMARY KEY(molecule)
            )NESTED TABLE especesAutorisees STORE AS tAutorisees;

CREATE TABLE Animaux
            (id PRIMARY KEY,
            CHECK (dernier_poids>0),
            CHECK (derniere_taille>0),
            CHECK (ANNEE_NAISSANCE > 1800),
            proprietaire NOT NULL,
            espece  NOT NULL,
            FOREIGN KEY(espece) REFERENCES Especes(nom),
          ) NESTED TABLE TraitementsPrescrits STORE AS tPrescription;


CREATE TABLE Clients
              (id INTEGER PRIMARY KEY ,
              nom VARCHAR(30) NOT NULL,
              prenom VARCHAR(30) NOT NULL,
              naissance date NOT NULL,
              adresse VARCHAR(300),
              tel VARCHAR(10) CHECK (REGEXP_LIKE(tel,'[[:digit:]]{10}')),
              animaux_possedes listeAnimaux,
              UNIQUE(nom,prenom,naissance) -- On definit une cle candidate
            )NESTED TABLE animaux_possedes STORE AS tListeAnimaux;

COMMIT;