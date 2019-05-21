INSERT INTO Clients VALUES 
                (9001,
                'Jugnot',
                'Gerard',
                TO_DATE('1955-12-04','YYYY-MM-DD'),
                '255 avenue foch, Paris',
                '0745869621');
                
INSERT INTO Clients VALUES 
                (9002,
                'Belmondo',
                'Jean-Paul',
                TO_DATE('1964-09-10','YYYY-MM-DD'),
                '1024 boulevard de la vilette, Niors',
                '0515487959');
INSERT INTO Clients VALUES 
                (9003,
                'Cotillard',
                'Marion',
                TO_DATE('1985-04-12','YYYY-MM-DD'),
                '41 rue de neuilly, Nanterre',
                '0256368596');

INSERT INTO Animaux VALUES (1, 'Griffon', 25.3, 1.058, 2012, 9001, TypEspece('chien', 'toutou'));
INSERT INTO Animaux VALUES (2, 'Manu', 208.7, 2.584, 2013, 9002, TypEspece('crocodile','reptile'));
INSERT INTO Animaux VALUES (3, 'Myrtille', 2.4, 0.268, 2014, 9003, TypEspece('truite','poisson'));

INSERT INTO Traitements VALUES 
                (2001,
                'traitement foie',
                TO_DATE('2015-06-06','YYYY-MM-DD'),
                TO_DATE('2015-06-10','YYYY-MM-DD'),
                1001,
                1, 
                listeMedoc(medoc('rinoxolone', 20),medoc('advil', 3)));
INSERT INTO Traitements VALUES 
                (2002,
                'traitement oeil',
                TO_DATE('2015-07-01','YYYY-MM-DD'),
                TO_DATE('2015-08-10','YYYY-MM-DD'),
                1002,
                2,
                listeMedoc(medoc('crisaline', 4)));

