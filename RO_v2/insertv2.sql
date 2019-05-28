insert into Classes_especes_animales values('mammifere');
insert into Especes values('chien', 'mammifere');

declare 
ref1 ref TypEspece;

begin

select ref(Es) into ref1
from Especes Es
where Es.nom = 'chien';

insert into medoc values('rinoxolone','desc_rinoxolone', listeEspecesAutorisees(RefEspece(ref1)));

end;


insert into veto values('prof', 'oak', TO_DATE('1111-11-11','YYYY-MM-DD'),'', '', 'mammifere');

declare
ref2 ref TypMedoc;
ref3 ref TypVeto;

begin

select ref(Me) into ref2
from Medoc Me
where Me.molecule = 'rinoxolone';

select ref(Ve) into ref3
from Veto Ve
where Ve.nom = 'prof' and Ve.prenom = 'oak' and Ve.naissance = TO_DATE('1111-11-11','YYYY-MM-DD');


insert into Traitements values(
    2001,
    'traitement foie',
    TO_DATE('2015-06-06','YYYY-MM-DD'),
    TO_DATE('2015-06-10','YYYY-MM-DD'),
    listeMedoc(
        RefMedocs(ref2, 20)),
    ref3);
end;

declare 
ref4 ref TypTraitement;

begin

select ref(Tr) into ref4
from Traitements Tr
where Tr.id = 2001;

insert into Animaux values(
    1, 
    'Griffon', 
    25.3, 
    1.058, 
    2012,
    'chien',
    ListeTraitement(RefTrait(ref4))
    );

end;

declare 
ref5 ref TypAnimal;

begin

select ref(An) into ref5
from Animaux An
where An.idAnimal = 1;

insert into Clients values(
    9001,
    'Jugnot',
    'Gerard',
    TO_DATE('1955-12-04','YYYY-MM-DD'),
    '255 avenue foch, Paris',
    '0745869621',
    listeAnimaux(RefAnimaux(ref5))
    );
    
end;


--------------------------------------------------

insert into Classes_especes_animales values('poisson');
insert into Especes values('truite','poisson');

declare 
r1 ref TypEspece;

begin
select ref(E) into r1
from Especes E
where E.nom = 'truite';

insert into medoc values('bronchioture','nettoie les bronchies', listeEspecesAutorisees(RefEspece(r1)));

end;

insert into veto values('Corsair','Pascal',TO_DATE('1974-07-22','YYYY-MM-DD'),'5 rue de l''auberge, Reims','0548789631','poisson'); 
insert into assistants values('Gaudron','Michel',TO_DATE('1978-06-27','YYYY-MM-DD'),'40 rue de la rose, Compiegne','0542788965','poisson');

declare 
r2 ref TypMedoc;
r3 ref TypVeto;

begin

select ref(M) into r2
from Medoc M
where M.molecule = 'bronchioture';

select ref(V) into r3
from Veto V
where V.nom = 'Corsair' and V.prenom = 'Pascal' and V.naissance = TO_DATE('1974-07-22','YYYY-MM-DD');

insert into Traitements values(
	2002,'traitement bronchie',TO_DATE('2015-06-08','YYYY-MM-DD'),TO_DATE('2015-06-18','YYYY-MM-DD'),
	listeMedoc(RefMedocs(r2,10)),r3);
end;

declare r4 ref TypTraitement;

begin

select ref(T) into r4
from Traitements T
where T.id = 2002;

insert into Animaux values(3,'Myrtille',2.4,.268,2014,'truite',ListeTraitement(RefTrait(r4)));

end;

declare 
r5 ref TypAnimal;

begin 

select ref(A) into r5
from Animaux A
where A.idAnimal = 3;

insert into Clients values(9003,'Cotillard','Marion',TO_DATE('1985-04-12','YYYY-MM-DD'),
'41 rue de neuilly, Nanterre','0256368596',listeAnimaux(RefAnimaux(r5)));

end;


