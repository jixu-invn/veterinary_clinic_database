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
    

if __name__ == '__main__':
    conn = psy.connect("dbname = 'dbbdd0p050' user='bdd0p050' host='tuxa.sme.utc' password='oN37PaLy'")
    print("OK")
    printClients(conn)
    
