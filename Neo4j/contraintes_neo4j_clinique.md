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
- (veto)-[:a\_pour\_spe]->(classe) : veto "*"--"1" classe. Pas d'attribut. 
- (client)-[:est\_le\_proprietaire_de]->(animal) : animal "*"--"1" client. Pas d'attribut.
- (animal)-[:a\_pour\_espece]->(espece) : animal "*"--"1" espece. Pas d'attribut.
- (espece)-[:a\_pour\_classe]-> (classe) : espece "*" -- "1" classe. Pas d'attribut.
- (medicament)-[:autorise\_pour]->(espece) : medicaments "*"--"*" espece. Pas d'attribut.
- (traitement)-[:prescrit_par]->(veto) : veto "1"--"*" traitement. Pas d'attribut.
- (traitement)-[:prescrit_a]->(animal) : traitement "*"--"1" animal. Pas d'attribut. Un médicament ne peut être prescrit à un animal que si l'animal appartient à une espèce pour laquelle le médicament est autorisé
- (traitement)-[:contient {quantite_journaliere:., fin: date({year:...., month:.., day:..})}]->(medicament) :  traitement "*"--"1..*" medicament. Deux attributs non nuls.



