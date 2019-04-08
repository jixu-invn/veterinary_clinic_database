Preuves de normalisation
===
L'enjeu de ce document est de prouver que chaque table sont 3NF. Nous passerons quasi-exclusivement
par une preuve de BCNF afin d'avoir des preuves rapides et efficaces.

# Assistants
## Dépendances fonctionnelles et clés
$`CM = \{ nom,prénom,naissance \rightarrow adresse;  nom,prénom,naissance \rightarrow tel;  nom,prénom,naissance \rightarrow spé;  nom,prénom,naissance \rightarrow id; id \rightarrow nom; id \rightarrow prénom; id \rightarrow naissance \}`$

On a $`(nom,prénom,naissance)`$ et $`id`$ comme clés.

## Preuve
On a toutes les DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Vétérinaires
## Dépendances fonctionnelles et clés
$`CM = \{ nom,prénom,naissance \rightarrow adresse;  nom,prénom,naissance \rightarrow tel;  nom,prénom,naissance \rightarrow spé;  nom,prénom,naissance \rightarrow id; id \rightarrow nom; id \rightarrow prénom; id \rightarrow naissance \}`$


On a $`(nom,prénom,naissance)`$ et $`id`$ comme clés.

## Preuve
On a toutes les DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Clients
## Dépendances fonctionnelles et clés
$`CM = \{ nom,prénom,naissance \rightarrow adresse;  nom,prénom,naissance \rightarrow tel; nom,prénom,naissance \rightarrow id; id \rightarrow nom; id \rightarrow prénom; id \rightarrow naissance \}`$


On a $`(nom,prénom,naissance)`$ et $`id`$ comme clés.

## Preuve
On a toutes les DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.