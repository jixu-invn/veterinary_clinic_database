MLD
===
# Relations

Assistants(#id : int, nom : string, prenom : string, naissance : date, adresse : string, tel : string, spé=>Classes\_espèces\_animal) avec {tel respectant RegEx des numéros de téléphone; nom, prenom, naissance, adresse, tel NOT NULL} 

Vétérinaires(#id : int, nom : string, prenom : string, naissance : date, adresse : string, tel : string, spé=>Classes\_espèces\_animal) avec {tel respectant RegEx des numéros de téléphone; nom, prenom, naissance, adresse, tel NOT NULL}

Clients(#id : int, nom : string, prenom : string, naissance : date, adresse : string, tel : string) avec {tel respectant RegEx des numéros de téléphone; nom, prenom, naissance, adresse, tel NOT NULL} 

Classes\_espèces\_animales(#nom : string)

Espèces(#nom : string, classe=>Classes\_espèces\_animales) avec {classe NOT NULL}

Animaux(#idAnimal: int, nom : string, dernier\_poids : float, derniere\_taille: float, annee\_naissance : int, propriétaire=>Clients, espèce=>Classes\_espèces\_animales) avec {propriétaire NOT NULL, annee_naissance >1800,
dernier\_poids>0, derniere\_taille>0, poids en kg, taille en m}, maj\_taille(), maj\_poids()

Traitements(#idTraitement:int, nom : string, début : date, véto=>Vétérinaires, animal=>Animaux) avec {nom, début NOT NULL}

Médicaments(#molécule: string, description: string) avec {description NOT NULL}

Traitement\_contient(#traitement=>Traitements,#medicament=>Médicaments,
 					fin : date, quantité\_journalière: int, /Duree\_traitement : int) avec {Fin>=Traitement.debut et NOT NULL; quantité\_journalière>0, en mg et NOT NULL}
 					

Medicament\_autorisé(#medicament=>Médicaments, #espèce=>Espèces)

# Contraintes

Tout traitement ne peut contenir que des médicaments autorisés pour l'espèce de l'animal

Projection(Traitement\_contient, traitement)=Projection(Traitements, idTraitement)

Projection(Medicament\_autorisé, medicament)=Projection(Medicaments,molécule)

// Les trois contraintes suivantes visent à obtenir un id unique d'identification des invidus ayant un nom identique
// Ainsi, on ne perdra pas d'information lors de la création des vues

Intersection(Projection(Veterinaires,id), Projection(Clients,id)) = {}

Intersection(Projection(Veterinaires,id), Projection(Assistants,id)) = {}

Intersection(Projection(Assistants,id), Projection(Clients,id)) = {}

# Vues

vIndividu = Union(Projection(Clients,id,nom,prenom,naissance,adresse,tel),Union(Projection(Vétérinaires,id,nom,prenom,naissance,adresse,tel),Projection(Assistants,id,nom,prenom,naissance,adresse,tel))

vPersonnel = Union(Projection(Vétérinaires,id,nom,prenom,naissance,adresse,tel,spé),Projection(Assistants,id,nom,prenom,naissance,adresse,tel,spé))

# Explications des choix

Nous avons fait le choix d'un héritage par classes filles car les deux cas les héritages
se font par rapport à des classes abstraites et sont exclusifs. De plus, une des deux classes
mères possède une association mais sachant qu'il s'agit d'une association 1:N vers une classe indépendante de l'héritage, cela ne pose
pas de pour la transformation par classe fille.

Nous avons fait le choix de créer une clé artificielle commune à tous les individus afin de ne pas perdre les doublons puisqu'il n'y a jamais
eu de définition d'une clé primaire. Notons qu'on aurait pu essayer de créer une clé primaire (après échange avec le client) à partir de plusieurs attributs mais
cela aurait complexifier la clé et/ou aurait créer une clé primaire non immutable donc nous avons favorisé l'option de la clé artificielle.

L'unicité de la clé artificielle entre individus est nécéssaire car en se basant sur le MLD rien empêche deux individus (quelle que soit la classefille dont ils dépendent)
d'avoir les mêmes attributs naturels. Ainsi, sans clé artificielle unique, l'union et la projection pourraient faire disparaitre des doublons et donc faire perdre de l'information.

Nous aurions pu éviter les contraintes sur les id des individus en faisant un héritage par référence mais cela aurait alourdi le MLD (si le client préfère cette option
nous pourrons changer très simplement le MLD).