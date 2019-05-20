INSERT INTO Clients VALUES 
                (1,
                'Jugnot',
                'Gerard',
                TO_DATE('1955-12-04','YYYY-MM-DD'),
                '255 avenue foch, Paris',
                '0745869621');
                
INSERT INTO Clients VALUES 
                (2,
                'Belmondo',
                'Jean-Paul',
                TO_DATE('1964-09-10','YYYY-MM-DD'),
                '1024 boulevard de la vilette, Niors',
                '0515487959');
INSERT INTO Clients VALUES 
                (3,
                'Cotillard',
                'Marion',
                TO_DATE('1985-04-12','YYYY-MM-DD'),
                '41 rue de neuilly, Nanterre',
                '0256368596');

INSERT INTO Animaux VALUES (1, 'Griffon', 25.3, 1.058, 2012, 1, TypEspece('chien', 'toutou'));
INSERT INTO Animaux VALUES (2, 'Manu', 208.7, 2.584, 2013, 2, TypEspece('crocodile','reptile'));
INSERT INTO Animaux VALUES (3, 'Myrtille', 2.4, 0.268, 2014, 3, TypEspece('truite','poisson'));

