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
