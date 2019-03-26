MLD
===
# Relations

**Assistants**(#id : int, nom : string, prenom : string, naissance : date, adresse : string, tel : string, spé=>Classes\_espèces\_animal) avec {tel respectant RegEx des numéros de téléphone; nom, prenom, naissance, adresse, tel, spé NOT NULL} 

**Vétérinaires**(#id : int, nom : string, prenom : string, naissance : date, adresse : string, tel : string, spé=>Classes\_espèces\_animal) avec {tel respectant RegEx des numéros de téléphone; nom, prenom, naissance, adresse, tel, spé NOT NULL}

**Clients**(#id : int, nom : string, prenom : string, naissance : date, adresse : string, tel : string) avec {tel respectant RegEx des numéros de téléphone; nom, prenom, naissance, adresse, tel NOT NULL} 

**Classes\_espèces\_animales**(#nom : string)

**Espèces**(#nom : string, classe=>Classes\_espèces\_animales) avec {classe NOT NULL}

**Animaux**(#idAnimal: int, nom : string, dernier\_poids : float, derniere\_taille: float, annee\_naissance : int, propriétaire=>Clients, espèce=>Espèces) avec {propriétaire NOT NULL; annee_naissance >1800;
dernier\_poids>0 et en kg; derniere\_taille>0 et en m; espèce NOT NULL; propriétaire NOT NULL}, maj\_taille(), maj\_poids()

**Traitements**(#idTraitement:int, nom : string, début : date, véto=>Vétérinaires, animal=>Animaux) avec {nom, début NOT NULL}

**Médicaments**(#molécule: string, description: string) avec {description NOT NULL}

**Traitement\_contient**(#traitement=>Traitements,#medicament=>Médicaments,
 					fin : date, quantité\_journalière: int, /Duree\_traitement : int) avec {fin>=Traitement.debut et NOT NULL; quantité\_journalière>0, en mg et NOT NULL; Durée\_traitement attribut dérivé NOT NULL}
 					

**Medicament\_autorisé**(#medicament=>Médicaments, #espèce=>Espèces)

# Contraintes

Tout traitement ne peut contenir que des médicaments autorisés pour l'espèce de l'animal traité

Projection(Traitement\_contient, traitement)= Projection(Traitements, idTraitement) // Pour que chaque traitement contiennent des médicaments (respectant les cardinalités de l'UML)

Projection(Medicament\_autorisé, medicament)= Projection(Medicaments,molécule) // Pour que chaque médicament de la clinique soit autorisé pour une espèce (respectant les cardinalités de l'UML)



// Les trois contraintes suivantes visent à obtenir un id unique d'identification des invidus quelle que soit leur rôle dans la clinique

Intersection(Projection(Veterinaires,id), Projection(Clients,id)) = {}

Intersection(Projection(Veterinaires,id), Projection(Assistants,id)) = {}

Intersection(Projection(Assistants,id), Projection(Clients,id)) = {}

# Vues

vIndividu = Union(Projection(Clients,id,nom,prenom,naissance,adresse,tel),Union(Projection(Vétérinaires,id,nom,prenom,naissance,adresse,tel),Projection(Assistants,id,nom,prenom,naissance,adresse,tel))

vPersonnel = Union(Projection(Vétérinaires,id,nom,prenom,naissance,adresse,tel,spé),Projection(Assistants,id,nom,prenom,naissance,adresse,tel,spé))

# Explications des choix
## Individus

Nous avons fait le choix d'un **héritage par classes filles** car nos deux cas d'héritages
se font par rapport à des classes *abstraites* et sont *exclusifs*. De plus, une des deux classes
mères possède une association mais sachant qu'il s'agit d'une *association 1:N* vers une classe indépendante de l'héritage, cela ne pose
pas de problème pour la transformation par classe fille.

Nous avons fait le choix de créer une **clé artificielle commune à tous les individus** afin de ne pas perdre les doublons puisqu'il n'y a pas de clé naturelle.
Notons qu'on aurait pu essayer de créer une clé primaire (après échange avec le client) à partir de plusieurs attributs mais
cela aurait complexifier la clé et/ou aurait créer une clé primaire non immutable donc nous avons favorisé l'option de la clé artificielle.

L'unicité de la clé artificielle entre individus est nécéssaire car en se basant sur le MCD rien empêche deux individus (quelle que soit la classe fille dont ils dépendent)
d'avoir les mêmes attributs naturels. Ainsi, sans clé artificielle, l'union et la projection pourraient faire disparaitre des *doublons* et donc faire perdre de l'information.

Nous aurions pu éviter les contraintes sur les id des individus en faisant un *héritage par référence* mais cela aurait **alourdi** le MLD (*si le client préfère cette option
nous pourrons changer très simplement le MLD*).

## Clés artificielles pour Animaux et Traitement
Ici encore, il n'y a pas de clé naturelle. Dans ces deux classes, nous avons décidé d'utiliser des clés artificelles pour avoir les clés primaires **les plus simples**.
On aurait pu ici également discuter avec le client pour créer des clés primaires composées mais l'argument de simplicité de la clé primaire favorise l'utilisation d'une clé artificielle.