Contraintes non gérées par le SQL
===

# A gérer au niveau applicatif

* La regex du téléphone (nous aurions pu l'implémenter en SQL avec un check mais cela peut s'exprimer différemment selon les SGBD [REGEX_LIKE par exemple] et nous préférons rester sur du SQL pur)
* Tout traitement ne peut contenir que des médicaments autorisés pour l'espèce de l'animal traité (peut-être gérable avec trigger)
* Affichage des unités de taille et poids (importants pour avoir une cohérence des valeurs permettant d'effectuer des traitements statistiques)
* maj_poids(), maj_taille(), Durée\_traitement [attribut dérivé]

# A gérer avec trigger

* Projection(Traitement_contient, traitement)= Projection(Traitements, idTraitement) // Pour que chaque traitement contiennent des médicaments (respectant les cardinalités de l'UML)
* Projection(Medicament_autorisé, medicament)= Projection(Medicaments,molécule) // Pour que chaque médicament de la clinique soit autorisé pour une espèce (respectant les cardinalités de l'UML)
* Projection(Clients, id) = Projection(Animaux, propriétaire) // Chaque client a au moins un animal
* Intersection(Projection(Veterinaires, nom, prénom, naissance), Projection(Clients, nom, prénom, naissance)) = {}
* Intersection(Projection(Veterinaires,nom, prénom, naissance), Projection(Assistants, nom, prénom, naissance)) = {}
* Intersection(Projection(Assistants, nom, prénom, naissance), Projection(Clients, nom, prénom, naissance)) = {}