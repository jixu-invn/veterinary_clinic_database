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
    t = PrettyTable(['ID Animal','ID proprietaire','Date de début','Date de fin de traitement','Medicament prescrit', 'Quantité journalière'])
    resultat = connexion.cursor()
    resultat.execute("SELECT a.id, a.proprietaire, t->>'debut', t->>'fin', m->>'molecule', m->>'qte' \
                        FROM animaux a, JSON_ARRAY_ELEMENTS(a.traitements) t, JSON_ARRAY_ELEMENTS(t->'medicaments') m")
    
    for ligne in resultat.fetchall():
        t.add_row(ligne)
    print(t)
 
 
def printStatMoyennesEspeces(connexion):
    print("Statistique : Caractéristiques moyennes de chaque espèce")
    t = PrettyTable(['Espece','Poids moyen','Taille moyenne'])
    resultat = connexion.cursor()
    resultat.execute("SELECT A.espece, AVG(A.dernier_poids) PoidsMoyen,AVG(A.derniere_taille) TailleMoyenne \
                        FROM Animaux A \
                        GROUP BY A.espece")
    
    for ligne in resultat.fetchall():
        t.add_row(ligne)
    print(t)

def printStatGlobalesMedoc(connexion):
    print("Statistique : Quantité totale prescrite de chaque médicament")
    t = PrettyTable(['Molecule','Quantité totale prescrite'])
    resultat = connexion.cursor()
    resultat.execute("SELECT m->>'molecule', SUM(CAST(m->>'qte' AS INTEGER)*(TO_DATE(t->>'fin','YYYY-MM-DD')-TO_DATE(t->>'debut','YYYY-MM-DD')+1)) \
                    FROM animaux a, JSON_ARRAY_ELEMENTS(a.traitements) t, JSON_ARRAY_ELEMENTS(t->'medicaments') m\
                    GROUP BY m->>'molecule'")
    
    for ligne in resultat.fetchall():
        t.add_row(ligne)
    print(t)

def printStatQteMedocParAnimal(connexion):
    print("Statistique : Quantité de chaque médicament prescrite à chaque animal")
    t = PrettyTable(['ID Animal','Molecule','Quantité totale prescrite'])
    resultat = connexion.cursor()
    resultat.execute("SELECT a.id, m->>'molecule', SUM(CAST(m->>'qte' AS INTEGER)*(TO_DATE(t->>'fin','YYYY-MM-DD')-TO_DATE(t->>'debut','YYYY-MM-DD')+1)) \
                    FROM animaux a, JSON_ARRAY_ELEMENTS(a.traitements) t, JSON_ARRAY_ELEMENTS(t->'medicaments') m\
                    GROUP BY a.id, m->>'molecule'")
    
    for ligne in resultat.fetchall():
        t.add_row(ligne)
    print(t)

def printStatBonus(connexion):
    print("Statistique bonus: Nombre de vétérinaires consultés par chaque client")
    t = PrettyTable(['Nom','Prenom','Naissance','Nombre de vétérinaires consultés'])
    resultat = connexion.cursor()
    resultat.execute("SELECT C.nom, C.prenom, C.naissance, COUNT(DISTINCT t->>'veto') AS Nb_veto_consultes \
    FROM Animaux A JOIN Clients C ON A.proprietaire = C.id, JSON_ARRAY_ELEMENTS(a.traitements) t \
    GROUP BY C.nom, C.prenom, C.naissance")
    
    for ligne in resultat.fetchall():
        t.add_row(ligne)
    print(t)


if __name__ == '__main__':
    conn = psy.connect("dbname = 'dbbdd0p050' user='bdd0p050' host='tuxa.sme.utc' password='oN37PaLy'")
    print("OK")
    printClients(conn)
    printAnimaux(conn)
    printMedocPrescrits(conn)
    printStatBonus(conn)
