INSERT INTO Classes_especes_animales VALUES ('mammifere');
INSERT INTO Classes_especes_animales VALUES ('reptile');
INSERT INTO Classes_especes_animales VALUES ('oiseau');
INSERT INTO Classes_especes_animales VALUES ('poisson');

INSERT INTO Assistants VALUES ('1','Wagner','Gerard','1965-08-25','12 rue des peupliers, Paris','0978458652','mammifere');
INSERT INTO Assistants VALUES ('2','Gaudron','Michel','1978-09-25','40 rue de la rose, Compiegne','0542788965','poisson');
INSERT INTO Assistants VALUES ('3','Delarue','Francoise','1973-01-05','39 avenue jules ferry, Lyon','0378459632','reptile');
INSERT INTO Assistants VALUES ('4','Delaporte','Henry','1960-02-26','10 le vautron, Sablonnieres','0285963274','oiseau');
/*INSERT INTO Assistants VALUES ('7','Wagner','Gerard','1965-08-25','12 rue des peupliers, Paris','0978458652','mammifere');
ERREUR: la valeur d'une cle dupliquee rompt la contrainte unique « assistants_nom_prenom_naissance_key » DETAIL: La cle « (nom, prenom, naissance)=(Wagner, Gerard, 1965-08-25) » existe dejà*/

INSERT INTO Veterinaires VALUES ('1','Corsair','Pascal','1974-07-22','5 rue de l''auberge, Reims','0548789631','poisson');
INSERT INTO Veterinaires VALUES ('2','Lamart','Marc','1990-04-15','2 rue de compiegne, Soissons','0478956314','mammifere');
INSERT INTO Veterinaires VALUES ('3','Colombain','Sebastien','1985-08-30','8 boulevard malesherbes, Paris','0164044098','reptile');
INSERT INTO Veterinaires VALUES ('4','Sorel','Valerie','1968-04-24','10 place de la bourse, Autreville','0578946321','oiseau');
/*INSERT INTO Veterinaires VALUES ('4','Oak','Samuel','1968-04-24','Bourg-Palette, Autreville','0578946321','oiseau');
la valeur d'une cle dupliquee rompt la contrainte unique « veterinaires_pkey » DETAIL: La cle « (id)=(4) » existe dejà*/

INSERT INTO Clients VALUES ('1','Jugnot','Gerard','1955-12-04','255 avenue foch, Paris','0745869621');
INSERT INTO Clients VALUES ('2','Belmondo','Jean-Paul','1964-09-10','1024 boulevard de la vilette, Niors','0515487959');
INSERT INTO Clients VALUES ('3','Cotillard','Marion','1985-04-12','41 rue de neuilly, Nanterre','0256368596');
INSERT INTO Clients VALUES ('4','Bellucci','Monica','1976-01-22','85 rue Chantilly, Marseille','0485963214');

INSERT INTO Especes VALUES ('chien','mammifere');
INSERT INTO Especes VALUES ('crocodile','reptile');
INSERT INTO Especes VALUES ('truite','poisson');
INSERT INTO Especes VALUES ('perruche','oiseau');

INSERT INTO Animaux VALUES ('1','Griffon','25.3','1.058','2012','1','chien');
INSERT INTO Animaux VALUES ('2','Manu','208.7','2.584','2013','2','crocodile');
INSERT INTO Animaux VALUES ('3','Myrtille','2.4','.268','2014','3','truite');
INSERT INTO Animaux VALUES ('4','Pierre','0.456','.147','2015','4','perruche');

INSERT INTO Traitements VALUES ('1','traitement foie','2015-06-06','1','1');
INSERT INTO Traitements VALUES ('2','traitement oeil','2015-06-07','2','2');
INSERT INTO Traitements VALUES ('3','traitement bronchie','2015-06-08','3','3');
INSERT INTO Traitements VALUES ('4','traitement estomac','2015-06-09','4','4');

INSERT INTO Medicaments VALUES ('rinoxolone','debloque le foie');
INSERT INTO Medicaments VALUES ('crisaline','diminue le voile');
INSERT INTO Medicaments VALUES ('bronchioture','nettoie les bronchies');
INSERT INTO Medicaments VALUES ('stomatose','diminue l''acidite');

INSERT INTO Traitement_contient VALUES ('1','rinoxolone','2015-08-06','15');
INSERT INTO Traitement_contient VALUES ('2','crisaline','2015-07-06','40');
INSERT INTO Traitement_contient VALUES ('3','bronchioture','2015-06-18','10');
INSERT INTO Traitement_contient VALUES ('4','stomatose','2015-06-29','5');

INSERT INTO Medicament_autorise VALUES ('rinoxolone','chien');
INSERT INTO Medicament_autorise VALUES ('crisaline','crocodile');
INSERT INTO Medicament_autorise VALUES ('bronchioture','truite');
INSERT INTO Medicament_autorise VALUES ('stomatose','perruche');
INSERT INTO Medicament_autorise VALUES ('stomatose','crocodile'); --on a bien une relation N:M

-- Ajouts de valeurs pour appuyer les statistiques du LMD
INSERT INTO Animaux VALUES ('5','Joyce','4.3','0.37','2008','1','chien');
INSERT INTO Traitements VALUES ('5','traitement oeil','2015-08-04','2','5');
INSERT INTO Traitement_contient VALUES ('5','crisaline','2015-08-30','50');











