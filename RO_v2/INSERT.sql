INSERT INTO Classes_especes_animales VALUES('toutou')
INSERT INTO Classes_especes_animales VALUES('reptile')
INSERT INTO Classes_especes_animales VALUES('poisson')

INSERT INTO Especes VALUES('chien','toutou')
INSERT INTO Especes VALUES('crocodile','reptile')
INSERT INTO Especes VALUES('truite','poisson')

INSERT INTO Clients VALUES 
                (9001,
                'Jugnot',
                'Gerard',
                TO_DATE('1955-12-04','YYYY-MM-DD'),
                '255 avenue foch, Paris',
                '0745869621',
                listeAnimaux(RefAnimaux(TypAnimal(1, 'Griffon', 25.3, 1.058, 2012, 'chien'))),
                ListeTraitement(RefTrait(TypTraitement(2001, 
                                                       'traitement foie', 
                                                       TO_DATE('2015-06-06','YYYY-MM-DD'),
                                                       TO_DATE('2015-06-10','YYYY-MM-DD'),
                                                       listeMedoc(RefMedocs(TypMedoc('rinoxolone', 
                                                                                     'desc_rinoxolone', 
                                                                                     listeEspecesAutorisees(RefEspece(TypEspece('chien', 'toutou')))), 20),
                                                                  RefMedocs(TypMedoc('advil', 
                                                                                     'desc_advil', 
                                                                                     listeEspecesAutorisees(RefEspece(TypEspece('chien', 'toutou')),
                                                                                                            RefEspece(TypEspece('crocodile', 'reptile')))), 3))))),
                TypVeto('', '', TO_DATE('','YYYY-MM-DD'), '', '', 'toutou'));
                
INSERT INTO Clients VALUES 
                (9002,
                'Belmondo',
                'Jean-Paul',
                TO_DATE('1964-09-10','YYYY-MM-DD'),
                '1024 boulevard de la vilette, Niors',
                '0515487959',
                listeAnimaux(RefAnimaux(TypAnimal(2, 'Manu', 208.7, 2.584, 2013, 'crocodile'))),
                ListeTraitement(RefTrait(TypTraitement(2002, 
                                                       'traitement oeil', 
                                                       TO_DATE('2015-07-01','YYYY-MM-DD'),
                                                       TO_DATE('2015-08-10','YYYY-MM-DD'),
                                                       listeMedoc(RefMedocs(TypMedoc('crisaline', 
                                                                                     'desc_crisaline', 
                                                                                     listeEspecesAutorisees(RefEspece(TypEspece('crocodile', 'reptile')))), 4))))),
                TypVeto('', '', TO_DATE('','YYYY-MM-DD'), '', '', 'reptile'));
                
INSERT INTO Clients VALUES 
                (9003,
                'Cotillard',
                'Marion',
                TO_DATE('1985-04-12','YYYY-MM-DD'),
                '41 rue de neuilly, Nanterre',
                '0256368596',
                listeAnimaux(RefAnimaux(TypAnimal(3, 'Myrtille', 2.4, 0.268, 2014, 'truite'))),
                NULL,
                NULL);

COMMIT;