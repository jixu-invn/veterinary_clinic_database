NOTE DE CLARIFICATION
===

Réalisation d’une base de données pour une clinique vétérinaire.

# Contexte 
L’administrateur veut gérer les clients, le personnel, les animaux traités et les médicaments administrés dans la clinique vétérinaire.

# Cahier des charges reformulé
Le client souhaite disposer des éléments ci-dessous dans sa base de données. On abordera une à une chaque entité et leurs interactions en mettant en avant les potentielles ambiguités que nous aborderons avec le client afin de les lever.

## Clients 
- Noms
- Prénoms
- Date de naissance
- Adresse
- Numéro de téléphone

Les clients possèdent un ou plusieurs animaux.

## Personnels 
- Noms
- Prénoms
- Date de naissance
- Adresse
- Numéro de téléphone
- Poste (vétérinaire ou assistant)
- Spécialité (mammifère, reptiles, oiseaux, autres)

Le personnel ne peut pas posséder d'animal traité dans la clinique. Un vétérinaire peut prescrire un traitement. Il peut préscrire plusieurs traitement à différents animaux.

Un personnel ne peut pas être supprimé de la base de donnée car il est nécessaire de pouvoir garder un historique des personnes ayant prescrit des traitements.

La clinique peut ajouter des spécialités elle-même 


## Animaux
- Nom
- Espèce
- Dernier poids mesuré
- Dernière taille mesurée
- Date de naissance (complète, incomplète, inconnue)

Un animal possède un *unique* propriétaire. Différents médecins peuvent préscrire des traitements à un même animal.


- Pas d'espèces autres.
- Un médecin non spécialisé dans la classe de l'animal peut lui prescrire un traitement.

## Médicaments

- Nom de molécule
- Description des effets
    
Un médicament ne pourra être préscrit qu'à certaines espèces bien définies.


Les médicaments sont identifiés par le nom de la molécule.


## Traitement :
 - Animal concerné
 - Début
 - Durée
 - Nom
 - Quantité à prendre par jour en mg/jour
 - Molécules concernées
 - Nom du vétérinaire
    
Nous allons considérer qu'un traitement peut contenir plusieurs médicaments dont la durée d'administration pourra varier. Cela évitera de créer plusieurs traitements ne contenant qu'un médicament mais avec des durées différentes.
Notons que ces informations sur les traitements ne sont pas destinées aux clients, il n'y a donc pas de nécessité d'avoir plus de détails tels que la fréquence d'administration du médicament, etc.
    
Des vétérinaires différents peuvent prescrire plusieurs traitements au même animal


## Informations statistiques
On pourra produire des informations statistiques à propos des différentes valeurs quantitatives de la base.



# Objet du projet
Disposer d’une base de données pour établir un bilan de la situation présente de la clinique vétérinaire au niveau du personnel, des clients, des animaux traités et des médicaments. Les informations statistiques fournies par la base de données telles que la quantité de chaque type de médicaments prescrit pour un animal donné lui permettront de faire des prévisions par exemple sur l’état de ces stocks de médicaments.

# Produit du projet
Il sera rendu au client les livrables hebdomadaires suivants :
- Note De Clarification (NDC)
- Modèle Conceptuel des Données (MCD)
- Modèle Logique des Données (MLD)
- Partie SQL - Langage de Définition des Données de la base de données (base de données et données de test) (SQL LDD)
- Partie SQL – Langage de Manipulation de Données (SQL LMD)
- Preuve de Concept  portant sur les technologies suivantes :
- POC  Neo4J ou MongoDB
- POC  Oracle RO
- POC  Oracle/XML
- POC  PostgreSQL/JSON
- Documentation en langue française concernant  le descriptif et l’utilisation de la base de données.

Dans le cas d’une modification d’un livrable déjà rendu, le client recevra une Note De Révision (NDR) contenant les modifications apportées.
Selon la volumétrie indicative des projets, la base de données devra contenir :
- 15 Classes/Tables
- 15 Associations
- 50 Attributs
- 5   Vues

# Objectifs visés

- Le code informatique devra s’exécuter correctement selon la version de PostgreSQL installée sur les serveurs de l’UTC
- Les applications seront potentiellement réalisées en PHP et être déployées sur les serveurs de l’UTC.
- Les livrables seront rendu à question d’un par semaine dans l’ordre énoncé précédemment à partir du mardi 12 mars 2019. La date de rendu du projet est estimée entre le 17 et le 30 juin 2019.



    
# Acteurs du projet

 - *Client* : Benjamin Lussier
 - Maîtres d’œuvre : Jingyuan Guan, Jiali Xu, Marc Damie, Alix Candusso, Valentin Rousseau