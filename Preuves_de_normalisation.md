Preuves de normalisation
===
L'enjeu de ce document est de prouver que chaque table sont 3NF. Nous passerons quasi-exclusivement
par une preuve de BCNF afin d'avoir des preuves rapides et efficaces.

**Remarque**: on considérera que tous les attributs de chaque table sont atomiques. En tout cas, ils sont
conçus pour l'être et il faudra que l'applicatif puisse vérifier cela à l'aide d'expressions régulières.

# Assistants
## Dépendances fonctionnelles et clés
$`CM_{Assistants} = \{ nom,prénom,naissance \rightarrow adresse;  nom,prénom,naissance \rightarrow tel;  nom,prénom,naissance \rightarrow spé;  nom,prénom,naissance \rightarrow id; id \rightarrow nom; id \rightarrow prénom; id \rightarrow naissance \}`$

On a $`(nom,prénom,naissance)`$ et $`id`$ comme clés.

## Preuve
On a toutes les DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Vétérinaires
## Dépendances fonctionnelles et clés
$`CM_{Vétérinaires} = \{ nom,prénom,naissance \rightarrow adresse;  nom,prénom,naissance \rightarrow tel;  nom,prénom,naissance \rightarrow spé;  nom,prénom,naissance \rightarrow id; id \rightarrow nom; id \rightarrow prénom; id \rightarrow naissance \}`$


On a $`(nom,prénom,naissance)`$ et $`id`$ comme clés.

## Preuve
On a toutes les DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Clients
## Dépendances fonctionnelles et clés
$`CM_{Clients} = \{ nom,prénom,naissance \rightarrow adresse;  nom,prénom,naissance \rightarrow tel; nom,prénom,naissance \rightarrow id; id \rightarrow nom; id \rightarrow prénom; id \rightarrow naissance \}`$


On a $`(nom,prénom,naissance)`$ et $`id`$ comme clés.

## Preuve
On a toutes les DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Classes d'espèces animales
La preuve est triviale puisque la table ne contient qu'un attribut. Donc cette table est également 3NF.

# Espèces
## Dépendances fonctionnelles et clés
$`CM_{Espèces} = \{ nom \rightarrow Classe\}`$


On a uniquement $`nom`$ comme clé.

## Preuve
La seule DF est de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Animaux
## Dépendances fonctionnelles et clés
$`CM_{Animaux} = \{ id \rightarrow nom; id \rightarrow dernier\_poids; id \rightarrow dernière\_taille; id \rightarrow annee\_naissance; id \rightarrow propriétaire; id \rightarrow espece;\}`$


On a uniquement $`id`$ comme clé.

## Preuve
On a toutes les DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Médicaments
## Dépendances fonctionnelles et clés
$`CM_{Médicaments} = \{ molécule \rightarrow description\}`$


On a uniquement $`molécule`$ comme clé.

## Preuve
On a l'unique DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Médicament\_autorisé
## Dépendances fonctionnelles et clés
$`CM_{Médicament\_autorisé} = \{\}`$


Ainsi, on a $`(médicament, espèce)`$ comme clé.

## Preuve
L'ensemble des attributs forme la clé donc la preuve du 3NF est triviale.