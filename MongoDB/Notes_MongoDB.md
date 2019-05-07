POC MongoDB
===

Classes représentées: client, animal, espèce, classe_espèces_animales, médicament, traitement
La clinique a plusieurs clients. Ils peuvent posséder des animaux (pas forcément). Ils ont un nom, 
un prénom, une date de naissance, une adresse et un numéro de téléphone. On déduira la possession d'un
animal par le fait qu'un animal ait un client comme propriétaire, c'est-à-dire qu'on ne listera pas les animaux possédés
dans les documents relatifs au client.
**Si la clinique le souhaite**, on pourra ajouter cette fonctionnalité afin de simplifier la manipulation des données.

Les animaux ont un nom, un poids, une taille, une espèce, une année de naissance et un propriétaire.

Les traitements sont nommés et liés à un unique animal. Le traitement a un début et contient des médicaments ayant
chacun leur date de fin de traitement et leur dose journalière.

## Les id
On a défini des id à la main pour la collection animaux car nous avions besoin de ses id pour faire des références. A l'instar de l'exo _Au ciné avec Mongo II_, on a fait
ce choix car il n'existait pas de clé naturelle. En revanche, on utilise la clé naturelle (nom,prenom,naissance) pour faire référence aux éléments de la collection clients.
Cela permet également d'effectuer des requêtes intéressantes telles que : `db.animaux.find({"proprietaire.nom":"Belmondo"})`

On fait référence aux clients en tant que propriétaires dans la collection animaux. Et on fait référence aux animaux dans la collection
traitements. On laisse mongo définir un id pour les documents des collection traitements et clients car nous n'avons pas besoin de ceux-ci(soit on ne fait jamais de références
vers les documents de la collection soit il existe déjà une clé naturelle).

Notons que selon les demandes du client on pourrait ajouter des informations et **créer de la redondance**. Par exemple, si on souhaite accéder rapidement au numéro de téléphone du prorpiétaire 
d'un animal, on pourrait ajouter le numéro de téléphone en plus de la clé naturelle lors de la référence. Cette donnée ne servira pas à effectuer des jointures mais bien à accélérer une 
requête précise. Nous n'avons pas créé de redondance particulière faute de demande précise du client.

# Ce que le NoSQL nous a fait perdre
On a évidemment perdu le contrôle de la cohérence et des contraintes. Comme nous n'avons pas de schéma, nous ne pouvons 
avoir de contraintes. Il n'y a plus de clés (autre que l'ObjectID), il n'y a plus d'arités contraintes. 
De plus, certaines opérations, telles que les jointures entre animaux et clients afin d'obtenir les animaux d'un client,
seront compliquées à effectuer car les SGBD documentaires n'envisagent pas le concept de jointure.
Il faudra utiliser du javascript afin de produire ce type d'information.

# Ce qu'on gagne
On gagne une possible distribution de notre SGBD. On a donc une très bonne scalabilité de notre système.
Il sera également plus simple d'extraire des informations comme la liste des traitements contenant un médicament donné.
Dans notre contexte, on aura pas à faire de jointure (ce qui était nécessaire en relationnel). On aura cependant aucune certitude quant à la
cohérence du résultat.

On pourra faire cela avec la commande suivante : `db.traitements.find({"contient.medoc":"crisaline"})`

# Conclusion
On a donc opté pour une base de données bien plus flexible et scalable mais on aura 
des problèmes d'incohérences et de manipulation de données (dans le cadre de requêtes complexes).