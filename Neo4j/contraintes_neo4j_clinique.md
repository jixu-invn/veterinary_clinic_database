Contraintes non exprimées par neo4j
===

# ATTRIBUTS :

• veto :
- (firstname, lastname, naissance) KEY
- adresse NOT NULL
- tel NOT NULL

• client :
- (firstname, lastname, naissance) KEY
- adresse NOT NULL
- tel NOT NULL

• animal :
- name NOT NULL
- taille > 0
- pods > 0
- naissance : en année (un date précise n'est pas nécessaire), > 1800

• espece :
- name KEY

• medicament :
- name KEY //name est le nom de la molecule
- description NOT NULL

• traitement :
- quantite_journaliere NOT NULL
- fin NOT NULL

# LIENS POSSIBLES ENTRE LES NOEUDS :

- un vétérinaire a pour specialité une classe_espèces_animales
- une classe_espèces_animales peut être la spécialité d'aucun ou plusieurs vétérinaires
- un vétérinaire peut prescrire plusieurs traitements
- un traitement est prescrit par un vétérinaire
- un traitement comporte au moins un medicament
- un médicament peut faire partie d'aucun ou plusieurs traitements
- un médicament est autorisé pour au moins une espèce
- une espèce peut être autorisée pour prendre aucun ou plusieurs médicaments
- un client possède au moins un animal
- un animal est possedé par un client
- un traitement est prescrit à un animal
- un animal peut avoir aucun ou plusieurs traitements
- un animal appartient à une espèce
- une espèce peut détenir aucun ou plusieurs animaux

# CARDINALITES :

- Chaque veto a une spécialité  et plusieurs veto peuvent avoir la même spécialité: veto "*"--"1" classe
- Un client peut posseder plusieurs animaux mais un animal n'est lié qu'à un seul client : animal "*"--"1" client
- Un animal n'appartient qu'à une seule espèce : animal "*"--"1" espece
- Un medicament peut être prescrit dans plus traitements et un traitement peut contenir plusieurs medicaments : traitement "*"--"1..*" medicament
- Un veto peut prescrire plusieurs traitements : veto "1"--"*" traitement
- Plusieurs traitements peuvent être prescris à un animal : traitement "*"--"1" animal
- Plusieurs medicaments peuvent être autorisés pour plusieurs espèces : medicaments "*"--"*" espece
- Un médicament ne peut être prescrit à un animal que si l'animal appartient à une espèce pour laquelle le médicament est autorisé


