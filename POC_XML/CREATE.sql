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
            Traitements XMLTYPE,
            proprietaire INTEGER NOT NULL,
            espece TO BE DEFINED,
            FOREIGN KEY (proprietaire) REFERENCES Clients(id)
          );
          
