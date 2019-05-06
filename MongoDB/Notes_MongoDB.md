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

# Ce que le NoSQL nous a fait perdre
On a perdu évidemment le contrôle de la cohérence et des contraintes. Comme nous n'avons pas de schéma, nous ne pouvons 
avoir des contraintes. Il n'y a plus de clés, il n'y a plus d'arités contraintes. 
De plus, certaines opérations, telles que les jointures entre animaux et clients afin d'obtenir les animaux d'un client,
seront compliqués à effectuer car les SGBD documentaires n'envisagent pas le concept de jointure.
Il faudra utiliser du javascript afin de produire ce type d'information.

# Ce qu'on gagne
On gagne une possible distribution de notre SGBD. On a donc une très bonne scalabilité de notre système.
Il sera également plus simple d'extraire des informations du type liste des traitements contenant un médicament donné.
Dans notre contexte, on aura pas à faire de jointure (ce qui était nécessaire en relationnel). On aura cependant aucune certitude quant à la
cohérence du résultat.

On pourra faire cela avec la commande suivante : `db.traitements.find({"contient.medoc":"crisaline"})`

# Conclusion
On a donc opté pour une base de données bien plus flexible et scalable mais on aura 
des problèmes d'incohérences et de manipulation de données (dans le cadre de requêtes complexes).