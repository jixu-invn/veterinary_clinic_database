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
CREATE TYPE TypAnimal AS OBJECT(
            id INTEGER,
            nom VARCHAR(30),
            dernier_poids FLOAT,
            derniere_taille FLOAT,
            annee_naissance INTEGER,
            proprietaire INTEGER,
            espece VARCHAR(50),
            FOREIGN KEY (proprietaire) REFERENCES Clients(id)
          );


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
            
CREATE TABLE Animaux
            (id PRIMARY KEY,
            CHECK (dernier_poids>0),
            CHECK (derniere_taille>0),
            CHECK (ANNEE_NAISSANCE > 1800),
            proprietaire NOT NULL,
            espece  NOT NULL,
            FOREIGN KEY(espece) REFERENCES Especes(nom),
            FOREIGN KEY (proprietaire) REFERENCES Clients(id)
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