Preuves de normalisation
===
L'enjeu de ce document est de prouver que chaque table sont 3NF. Nous passerons exclusivement
par une preuve de BCNF afin d'avoir des preuves rapides et efficaces.

**Remarque**: on considérera que tous les attributs de chaque table sont atomiques. En tout cas, ils sont
conçus pour l'être et il faudra que l'applicatif puisse vérifier cela à l'aide d'expressions régulières.

Dans l'ensemble des preuves, **la minimalité des clés** sera montrée grâce à la couverture minimale et la **dépendance fonctionnelle de l'ensemble des attributs** sera faite grâce à la cloture transitive. 

# Assistants
## Dépendances fonctionnelles et clés
$`CM_{Assistants} = \{ nom,prénom,naissance \rightarrow adresse;  nom,prénom,naissance \rightarrow tel;  nom,prénom,naissance \rightarrow spé;  nom,prénom,naissance \rightarrow id; id \rightarrow nom; id \rightarrow prénom; id \rightarrow naissance \}`$

$`F^+_{Assistants} = \{ nom,prénom,naissance \rightarrow adresse;  nom,prénom,naissance \rightarrow tel;  nom,prénom,naissance \rightarrow spé;  nom,prénom,naissance \rightarrow id; id \rightarrow nom; id \rightarrow prénom; id \rightarrow naissance; id \rightarrow tel; id \rightarrow adresse; id \rightarrow spé \}`$

On a $`(nom,prénom,naissance)`$ et $`id`$ comme clés (déterminent bien l'ensemble des attributs et sont minimales).

## Preuve
On a toutes les DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé. 

Ainsi, cette table est BNCF et donc est également 3NF.

## Remarque

On pourrait penser à tort que l'adresse ou le numéro de téléphone détermine d'autres attributs.
En effet, le téléphone peut être fixe et donc plusieurs personnes auront le même numéro.
Un couple (ou des colocataires) aura une adresse commune.

Cette remarque tient pour toutes les tables relatives à des individus. 

# Vétérinaires
## Dépendances fonctionnelles et clés
$`CM_{Vétérinaires} = \{ nom,prénom,naissance \rightarrow adresse;  nom,prénom,naissance \rightarrow tel;  nom,prénom,naissance \rightarrow spé;  nom,prénom,naissance \rightarrow id; id \rightarrow nom; id \rightarrow prénom; id \rightarrow naissance \}`$

$`F^+_{Vétérinaires} = \{ nom,prénom,naissance \rightarrow adresse;  nom,prénom,naissance \rightarrow tel;  nom,prénom,naissance \rightarrow spé;  nom,prénom,naissance \rightarrow id; id \rightarrow nom; id \rightarrow prénom; id \rightarrow naissance; id \rightarrow tel; id \rightarrow adresse; id \rightarrow spé \}`$


On a $`(nom,prénom,naissance)`$ et $`id`$ comme clés (déterminent bien l'ensemble des attributs et sont minimales).

## Preuve
On a toutes les DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Clients
## Dépendances fonctionnelles et clés
$`CM_{Clients} = \{ nom,prénom,naissance \rightarrow adresse;  nom,prénom,naissance \rightarrow tel; nom,prénom,naissance \rightarrow id; id \rightarrow nom; id \rightarrow prénom; id \rightarrow naissance \}`$

$`F^+_{Clients} = \{ nom,prénom,naissance \rightarrow adresse;  nom,prénom,naissance \rightarrow tel;  nom,prénom,naissance \rightarrow id; id \rightarrow nom; id \rightarrow prénom; id \rightarrow naissance; id \rightarrow tel; id \rightarrow adresse \}`$


On a $`(nom,prénom,naissance)`$ et $`id`$ comme clés (déterminent bien l'ensemble des attributs et sont minimales).

## Preuve
On a toutes les DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Classes d'espèces animales
La preuve est triviale puisque la table ne contient qu'un attribut. Donc cette table est également 3NF.

# Espèces
## Dépendances fonctionnelles et clés
$`CM_{Espèces} = \{ nom \rightarrow Classe\} = F^+_{Espèces}`$


On a uniquement $`nom`$ comme clé (détermine bien l'ensemble des attributs et est minimale).

## Preuve
La seule DF est de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Animaux
## Dépendances fonctionnelles et clés
$`CM_{Animaux} = \{ id \rightarrow nom; id \rightarrow dernier\_poids; id \rightarrow dernière\_taille; id \rightarrow annee\_naissance; id \rightarrow propriétaire; id \rightarrow espece;\}`$


On a uniquement $`id`$ comme clé (détermine bien l'ensemble des attributs et est minimale).

## Preuve
On a toutes les DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

## Remarque
On pourrait ajouter la DF $`(propriétaire, nom) \rightarrow id`$ et cela ajouterait donc le membre de gauche comme clé (ce qui n'est pas le cas dans notre SQL).

Cependant, cela ne changerait aucunement la démonstration.

# Médicaments
## Dépendances fonctionnelles et clés
$`CM_{Médicaments} = \{ molécule \rightarrow description\}`$


On a uniquement $`molécule`$ comme clé (détermine bien l'ensemble des attributs et est minimale).

## Preuve
On a l'unique DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Médicament\_autorisé
## Dépendances fonctionnelles et clés
$`CM_{Médicament\_autorisé} = \{\} = F^+_{Médicament\_autorisé}`$


Ainsi, on a $`(médicament, espèce)`$ comme clé (détermine bien l'ensemble des attributs et est minimale).

## Preuve
L'ensemble des attributs forme la clé donc la preuve du 3NF est triviale.

# Traitements
## Dépendances fonctionnelles et clés
$`CM_{Traitements} = \{ véto, début, animal \rightarrow nom; véto, début, animal \rightarrow id; id \rightarrow véto;  id \rightarrow début;  id \rightarrow animal\}`$


On a $`(véto, début, animal)`$ et $`id`$ comme clés (déterminent bien l'ensemble des attributs et sont minimales).

## Preuve
On a toutes les DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Traitement\_contient
## Dépendances fonctionnelles et clés
$`CM_{Traitement\_contient} = \{traitement, médicament \rightarrow fin\} = F^+_{Traitement\_contient}`$


On a $`(traitement, médicament)`$ comme unique clé (détermine bien l'ensemble des attributs et est minimale).

## Preuve
On a toutes les DF de la forme $` K \rightarrow A`$ avec $`K`$ une clé.

Ainsi, cette table est BNCF et donc est également 3NF.

# Conclusion
Comme nous avons veillé à supprimer toute redondance depuis le début du projet, les démonstrations de normalisation
sont toutes très simples.
