CREATE TABLE classe(
                    nom VARCHAR(30) PRIMARY KEY
                    );

CREATE TABLE espece(
                    nom VARCHAR(30) PRIMARY KEY,
                    classe VARCHAR(30) NOT NULL,
                    FOREIGN KEY (classe) REFERENCES classe(nom)
                    );

CREATE TABLE Clients
              (
              id INTEGER PRIMARY KEY ,
              nom VARCHAR(30) NOT NULL,
              prenom VARCHAR(30) NOT NULL,
              naissance date NOT NULL,
              adresse VARCHAR(300),
              tel VARCHAR(10) CHECK (tel ~ '[[:digit:]]{10}'),
              UNIQUE(nom,prenom,naissance) -- On definit une cle candidate
            );
            
            
CREATE TABLE Animaux
            (
            id INTEGER PRIMARY KEY ,
            nom VARCHAR(30),
            dernier_poids FLOAT CHECK (dernier_poids>0),
            derniere_taille FLOAT CHECK (derniere_taille>0),
            annee_naissance INTEGER CHECK (ANNEE_NAISSANCE > 1800),
            Traitements JSON,
            proprietaire INTEGER NOT NULL,
            espece VARCHAR(30) NOT NULL,
            FOREIGN KEY (proprietaire) REFERENCES Clients(id),
            FOREIGN KEY (espece) REFERENCES espece(nom)
          );
          
COMMIT;
