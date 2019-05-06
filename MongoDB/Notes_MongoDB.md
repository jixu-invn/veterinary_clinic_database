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
