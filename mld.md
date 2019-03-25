MLD
===

Assistants(#id : int, nom : string, prenom : string, naissance : date, adresse : string, tel : string, spé=>Classes\_espèces\_animal) avec {tel respectant RegEx des numéros de téléphone; nom, prenom, naissance, adresse, tel NOT NULL} 

Vétérinaires(#id : int, nom : string, prenom : string, naissance : date, adresse : string, tel : string, spé=>Classes\_espèces\_animal) avec {tel respectant RegEx des numéros de téléphone; nom, prenom, naissance, adresse, tel NOT NULL}

Clients(#id : int, nom : string, prenom : string, naissance : date, adresse : string, tel : string) avec {tel respectant RegEx des numéros de téléphone; nom, prenom, naissance, adresse, tel NOT NULL} 

// A CONFIRMER
Intersection(Projection(Veterinaires,id), Projection(Clients,id)) ={}
Intersection(Projection(Veterinaires,id), Projection(Assistants,id)) ={}
Intersection(Projection(Assistants,id), Projection(Clients,id)) ={}
// peut-être passage par références pour eviter les contraintes

vIndividu = Union(Projection(Clients,nom,prenom,naissance,adresse,tel),Union(Projection(Vétérinaires,nom,prenom,naissance,adresse,tel),Projection(Assistants,nom,prenom,naissance,adresse,tel))
vPersonnel = Union(Projection(Vétérinaires,nom,prenom,naissance,adresse,tel,spé),Projection(Assistants,nom,prenom,naissance,adresse,tel,spé))
// FIN A CONFIRMER

Classes\_espèces\_animales(#nom : string)

Espèces(#nom : string, classe=>Classes\_espèces\_animales) avec {classe NOT NULL}

Animaux(#id: int, nom : string, dernier\_poids : float, derniere\_taille: float, annee\_naissance : int, propriétaire=>Clients, espèce=>Classes\_espèces\_animales) avec {propriétaire NOT NULL, annee_naissance >1800,
dernier\_poids>0, derniere\_taille>0, poids en kg, taille en m}, maj\_taille(), maj\_poids()

Traitements(#id:int, nom : string, début : date, véto=>Vétérinaires, animal=>Animaux) avec {nom, début NOT NULL}

Médicaments(#molécule: string, description: string) avec {description NOT NULL}

Traitement\_contient(#traitement=>Traitements,#medicament=>Médicaments,
 					fin : date, quantité\_journalière: int, /Duree\_traitement : int) avec {Fin>=Traitement.debut et NOT NULL; quantité\_journalière>0, en mg et NOT NULL}
 					
Projection(Traitement\_contient, traitement)=Projection(Traitements, id)

Medicament\_autorisé(#medicament=>Médicaments, #espèce=>Espèces)

Projection(Medicament\_autorisé, medicament)=Projection(Medicaments,id)
