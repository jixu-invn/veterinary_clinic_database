MLD
===
# Relations

**Assistants**(#id : int, nom : string, prenom : string, naissance : date, adresse : string, tel : string, spé=>Classes\_espèces\_animal) avec {tel respectant RegEx des numéros de téléphone; nom, prenom, naissance, adresse, tel, spé NOT NULL; (nom,prenom,naissance) clé candidate} 

**Vétérinaires**(#id : int, nom : string, prenom : string, naissance : date, adresse : string, tel : string, spé=>Classes\_espèces\_animal) avec {tel respectant RegEx des numéros de téléphone; nom, prenom, naissance, adresse, tel, spé NOT NULL; (nom,prenom,naissance) clé candidate}

**Clients**(#id : int, nom : string, prenom : string, naissance : date, adresse : string, tel : string) avec {tel respectant RegEx des numéros de téléphone; nom, prenom, naissance, adresse, tel NOT NULL; (nom,prenom,naissance) clé candidate} 

**Classes\_espèces\_animales**(#nom : string)

**Espèces**(#nom : string, classe=>Classes\_espèces\_animales) avec {classe NOT NULL}

**Animaux**(#idAnimal: int, nom : string, dernier\_poids : float, derniere\_taille: float, annee\_naissance : int, propriétaire=>Clients, espèce=>Espèces) avec {propriétaire NOT NULL; annee_naissance >1800;
dernier\_poids>0 et en kg; derniere\_taille>0 et en m; espèce NOT NULL; propriétaire NOT NULL}, maj\_taille(), maj\_poids()

**Traitements**(#idTraitement:int, nom : string, début : date, véto=>Vétérinaires, animal=>Animaux) avec {nom, début, véto, animal NOT NULL}

**Médicaments**(#molécule: string, description: string) avec {description NOT NULL}

**Traitement\_contient**(#traitement=>Traitements,#medicament=>Médicaments,
 					fin : date, quantité\_journalière: int, ) avec {fin>=Traitement.debut et NOT NULL; quantité\_journalière>0, en mg et NOT NULL; Durée\_traitement attribut dérivé NOT NULL}
 					

**Medicament\_autorisé**(#medicament=>Médicaments, #espèce=>Espèces)

# Contraintes

Tout traitement ne peut contenir que des médicaments autorisés pour l'espèce de l'animal traité

Projection(Traitement\_contient, traitement)= Projection(Traitements, idTraitement) // Pour que chaque traitement contiennent des médicaments (respectant les cardinalités de l'UML)

Projection(Medicament\_autorisé, medicament)= Projection(Medicaments,molécule) // Pour que chaque médicament de la clinique soit autorisé pour une espèce (respectant les cardinalités de l'UML)

Projection(Clients, id) = Projection(Animaux, propriétaire) // Chaque client a au moins un animal


// Héritage exclusif

Intersection(Projection(Veterinaires, nom, prénom, naissance), Projection(Clients, nom, prénom, naissance)) = {}

Intersection(Projection(Veterinaires,nom, prénom, naissance), Projection(Assistants, nom, prénom, naissance)) = {}

Intersection(Projection(Assistants, nom, prénom, naissance), Projection(Clients, nom, prénom, naissance)) = {}

# Vues

vIndividu = Union(Projection(Clients, nom, prenom, naissance, adresse, tel), Union(Projection(Vétérinaires, nom, prenom, naissance, adresse, tel), Projection(Assistants, nom,prenom,naissance,adresse,tel))

vPersonnel = Union(Projection(Vétérinaires, nom, prenom, naissance, adresse, tel, spé),Projection(Assistants, nom, prenom, naissance, adresse, tel, spé))

# Explications des choix
## Individus

Nous avons fait le choix d'un **héritage par classes filles** car nos deux cas d'héritages
se font par rapport à des classes *abstraites* et sont *exclusifs*. De plus, une des deux classes
mères possède une association mais sachant qu'il s'agit d'une *association 1:N* vers une classe indépendante de l'héritage, cela ne pose
pas de problème pour la transformation par classe fille.

Nous avons fait le choix de créer une **clé artificielle** pour chaque classe fille afin de gérer plus facilement les références par clé étrangère

Nous aurions pu éviter les contraintes inter-classes filles en faisant un *héritage par référence* mais cela aurait **alourdi** le MLD (*si le client préfère cette option
nous pourrons changer très simplement le MLD*).

## Clés artificielles pour Animaux et Traitement
Ici, il n'y a pas de clé naturelle. Dans ces deux classes, nous avons décidé d'utiliser des clés artificelles pour avoir les clés primaires **les plus simples**.
On aurait pu ici également discuter avec le client pour créer des clés primaires composées mais l'argument de simplicité de la clé primaire favorise l'utilisation d'une clé artificielle.