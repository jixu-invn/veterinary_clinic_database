CREATE TYPE TypEspece AS OBJECT
          (nom VARCHAR(50),
          classe VARCHAR(30));
/
CREATE TYPE RefEspece AS OBJECT (refEsp REF TypEspece);
/
CREATE TYPE listeEspecesAutorisees AS TABLE OF RefEspece;
/
CREATE TYPE TypMedoc AS OBJECT(molecule VARCHAR(50), description VARCHAR(200), especesAutorisees listeEspecesAutorisees);
/
CREATE TYPE RefMedocs AS OBJECT (refMedoc REF TypMedoc, qte INTEGER);
/
CREATE TYPE listeMedoc AS TABLE OF RefMedocs;
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
            medicaments listeMedoc,
            veto REF TypVeto
            );
/
CREATE TYPE RefTrait AS OBJECT (refTraitement REF TypTraitement);
/
CREATE TYPE ListeTraitement AS TABLE OF RefTrait;
/
CREATE TYPE TypAnimal AS OBJECT(
            idAnimal INTEGER,
            nom VARCHAR(30),
            dernier_poids FLOAT,
            derniere_taille FLOAT,
            annee_naissance INTEGER,
            espece VARCHAR(50),
            TraitementsPrescrits ListeTraitement
          );
/
CREATE TYPE RefAnimaux AS OBJECT (refAnimal REF TypAnimal);
/
CREATE TYPE listeAnimaux AS TABLE OF RefAnimaux;
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
            PRIMARY KEY (nom),
            FOREIGN KEY (classe) REFERENCES Classes_especes_animales(nom)
            );
            
            
CREATE TABLE Medoc OF TypMedoc(
            PRIMARY KEY(molecule)
            )NESTED TABLE especesAutorisees STORE AS tAutorisees;

CREATE TABLE Animaux OF TypAnimal
            (
            PRIMARY KEY(idAnimal),
            CHECK (dernier_poids>0),
            CHECK (derniere_taille>0),
            CHECK (ANNEE_NAISSANCE > 1800),
            espece  NOT NULL,
            FOREIGN KEY(espece) REFERENCES Especes(nom)
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
            
create table Traitements of TypTraitement(
	id primary key,
	nom not null,
	debut not null,
	fin not null,
	SCOPE FOR (veto) IS veto
)nested table medicaments store as tMedicaments;

COMMIT;