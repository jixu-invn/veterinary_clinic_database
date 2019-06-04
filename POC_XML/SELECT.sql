Select A.traitements.EXTRACT('/traitements/traitement/@nom_veto').GETSTRINGVAL() as veto_myrtille, 
A.traitements.EXTRACT('/traitements/traitement/medicament').GETSTRINGVAL() as medoc_utilise,
A.traitements.EXTRACT('/traitements/traitement/medicament/@qte').GETSTRINGVAL() as quantite_prescrite
from Animaux A
where A.nom = 'Myrtille';

Select A.nom as Animal_patient_corsair
from Animaux A
where A.traitements.EXTRACT('/traitements/traitement/@nom_veto').GETSTRINGVAL() = 'Corsair'; 