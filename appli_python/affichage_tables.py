#!/usr/bin/python3
import psycopg2 as psy
from prettytable import PrettyTable
from datetime import date

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
 
 
def printStatMoyennesEspeces(connexion):
    t = PrettyTable(['Espece','Poids moyen','Taille moyenne'])
    resultat = connexion.cursor()
    resultat.execute("SELECT A.espece, AVG(A.dernier_poids) PoidsMoyen,AVG(A.derniere_taille) TailleMoyenne \
                        FROM Animaux A \
                        GROUP BY A.espece")
    
    for ligne in resultat.fetchall():
        t.add_row(ligne)
    print(t)

def printStatGlobalesMedoc(connexion):
    t = PrettyTable(['Molecule','Quantité totale prescrite'])
    resultat = connexion.cursor()
    resultat.execute("SELECT m->>'molecule', SUM(CAST(m->>'qte' AS INTEGER)*(TO_DATE(t->>'fin','YYYY-MM-DD')-TO_DATE(t->>'debut','YYYY-MM-DD')+1)) \
                    FROM animaux a, JSON_ARRAY_ELEMENTS(a.traitements) t, JSON_ARRAY_ELEMENTS(t->'medicaments') m\
                    GROUP BY m->>'molecule'")
    
    for ligne in resultat.fetchall():
        t.add_row(ligne)
    print(t)


if __name__ == '__main__':
    conn = psy.connect("dbname = 'dbbdd0p050' user='bdd0p050' host='tuxa.sme.utc' password='oN37PaLy'")
    print("OK")
    printClients(conn)
    printAnimaux(conn)
    printMedocPrescrits(conn)
    printStatGlobalesMedoc(conn)
