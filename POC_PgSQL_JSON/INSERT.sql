INSERT INTO CLASSE VALUES('mammifere');

INSERT INTO ESPECE VALUES('chien','mammifere');

INSERT INTO Clients VALUES(9001,'Jugnot','Gerard',TO_DATE('1955-12-04','YYYY-MM-DD'),'255 avenue foch, Paris','0745869621');

INSERT INTO Animaux Values(1001,'Griffon',25.3,1.058,2012,'
[
    {"debut":"2015-06-06", "fin":"2015-08-06", "veto" :{"nom":"Lamart", "pnom":"Jean"},
     "medicaments":[{"molecule":"rinoxolone", "qte":20}]
    },
    {"debut":"2015-06-07", "fin":"2015-09-08", "veto" :{"nom":"Lamart", "pnom":"Jean"},
     "medicaments":[{"molecule":"advil", "qte":20}]
    }
]',
9001,'chien');

