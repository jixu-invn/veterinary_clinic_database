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

