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
