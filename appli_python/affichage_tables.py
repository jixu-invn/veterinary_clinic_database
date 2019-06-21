#!/usr/bin/python3
import psycopg2 as psy
from prettytable import PrettyTable


#Requete qui affiche une collection dans une collection
#Pour chaque animal tous les médicaments qui lui ont été prescrit



def printClients(connexion):
    t = PrettyTable(['id','Nom','Prenom','Naissance','Adresse', 'Tel'])
    resultat = connexion.cursor()
    resultat.execute("SELECT * FROM Clients")
    
    for ligne in resultat.fetchall():
        t.add_row(ligne)
    print(t)


def printEspeces(connexion):
    t = PrettyTable(["Nom de l'espece",'Classe'])
    resultat = connexion.cursor()
    resultat.execute("SELECT * FROM Espece")
    
    for ligne in resultat.fetchall():
        t.add_row(ligne)
    print(t)
    
def printAnimaux(connexion):
    t = PrettyTable(['ID Animal','Nom','Poids', 'Taille', 'Année de naissance','Espèce', 'ID Propriétaire'])
    resultat = connexion.cursor()
    resultat.execute("SELECT id, nom, dernier_poids, derniere_taille, annee_naissance, espece,proprietaire FROM Animaux")
    
    for ligne in resultat.fetchall():
        t.add_row(ligne)
    print(t)
    
def printMedocPrescrits(connexion):
    t = PrettyTable(['ID Animal','ID proprietaire','Medicament prescrit'])
    resultat = connexion.cursor()
    resultat.execute("SELECT a.id, a.proprietaire, m->>'molecule' \
                        FROM animaux a, JSON_ARRAY_ELEMENTS(a.traitements) t, JSON_ARRAY_ELEMENTS(t->'medicaments') m")
    
    for ligne in resultat.fetchall():
        t.add_row(ligne)
    print(t)
    

if __name__ == '__main__':
    conn = psy.connect("dbname = 'dbbdd0p050' user='bdd0p050' host='tuxa.sme.utc' password='oN37PaLy'")
    print("OK")
    printClients(conn)
    printAnimaux(conn)
    printMedocPrescrits(conn)
