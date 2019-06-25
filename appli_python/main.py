#!/usr/bin/python3
import psycopg2 as psy
import affichage_tables as aff
import addTraitement as trait
import json

# ajout d'un animal
def InsertionAnimal(connexion):
    print("Vous avez choisi d'inserer un animal")
    id = input('Id: ')

    while not id.isdigit():
        id = input('Input invalide, veuillez entrer de nouveau:')

    nom = input('Nom d\'animal:')

    der_poids = input("Son dernier poids:")
    while (der_poids != '' and float(der_poids) < 0):
        der_poids = input("Le poids ne doit pas etre negative, veillez entrer de nouveau: \n")

    der_taille = input("Son dernier taille: ")
    while (der_taille != '' and float(der_taille) < 0):
        der_taille = input("La taille ne doit pas etre negative, veillez entrer de nouveau: \n")

    annee = input("Son annee de naissance: ")
    while (annee != '' and ((int(annee) < 1800) or (int(annee) > 2019))):
        annee = input("L\'annee de naissance est invalide, veuillez entrer de nouveau:\n")

    propri = input("Id du proprietaire: ")
    while not propri.isdigit():
        propri = input('Input invalide, veuillez entrer de nouveau: \n')

    espece = input("Son espece: ")

    sql = "INSERT INTO Animaux VALUES("
    sql = sql + id + ",'" + nom + "',"
    sql = sql+ der_poids + "," + der_taille + ","
    sql = sql + annee + ",NULL,'"
    sql = sql + propri + "','" + espece + "');"
    print(sql)
    connexion.cursor().execute(sql)
    
# ajout d'un client
def insertionClient(connexion):
    print("Vous avez choisi d'inserer un client")
    sql = "INSERT INTO Clients VALUES("
    id = input("ID: ")
    sql = sql+id+",'"
    nom = input("Nom: ")
    sql = sql+nom+"','"
    prenom = input("Prenom: ")
    sql = sql+prenom+"','"
    naissance = input("Date de naissance: (YYYY-MM-DD)")
    sql = sql+naissance+"','"
    adresse = input("Adresse: ")
    sql = sql+adresse+"','"
    telephone = input("Telephone(10 chiffres sans espace): ")
    sql = sql+telephone+"')"
    connexion.cursor().execute(sql)


#menu principal
def menu_p(connexion) :
    print("\n\n+++++++++++++\nBienvenue dans le menu\n+++++++++++++")
    print("Vos choix")
    print(" 1 : Voir le contenu de toutes les tables ")
    print(" 2 : Ajouter des enregistrements dans la base de données")
    print(" 3 : Voir le résultat des requetes statistiques")
    print(" 0 pour quitter\n+++++++++++++")
    choix = False
    while not choix:
        choix = input("Entrer le nombre correspondant au choix : ")
        if(choix != "0" and choix != "1" and choix != "2" and choix != "3" and choix != "4"):
            choix = False
    
    return choix
            
#menu secondaire
def menu_s(connexion, c):
    if(c == "1"):
        menu_1(connexion)
    if(c == "2"):
        menu_2(connexion)
    if(c == "3"):
        menu_3(connexion)

#menu 1 Voir le contenu de toutes les tables
def menu_1(connexion):
    print("\n\n+++++++++++++\nQuelle table voulez vous voir?")
    print("Tables disponibles:")
    print("1 : Clients")
    print("2 : Especes Animales")
    print("3 : Animaux")
    print("4 : Medicaments prescrits")
    print("0 pour quitter\n+++++++++++++")
    choix = False
    while not choix:
        choix = input("Entrer le nombre correspondant au choix : ")
        if( choix != "0" and choix != "1" and choix != "2" and choix != "3" and choix != "4"):
            choix = False
            
    if(choix == "1"):
        print("Affichage de la table: Clients")
        aff.printClients(connexion)
    if(choix == "2"):
        print("Affichage de la table: Especes animales")
        aff.printEspeces(connexion)
    if(choix == "3"):
        print("Affichage de la table: Animaux")
        aff.printAnimaux(connexion)
    if(choix == "4"):
        print("Affichage de la table: Medicaments prescrits")
        aff.printMedocPrescrits(connexion)

#menu 2 : Ajouter des enregistrements dans la base de données
def menu_2(connexion):
    print("\n\n+++++++++++++\nQue voulez vous ajouter?")
    print("1 : Ajouter des Clients")
    print("2 : Ajouter des animaux")
    print("3 : Ajouter des traitements")
    print("0 pour quitter\n+++++++++++++")
    choix = False
    while not choix:
        choix = input("Entrer le nombre correspondant au choix : ")
        if( choix != "0" and choix != "1" and choix != "2" and choix != "3"):
            choix = False

    if(choix == "1"):
        print("Affichage de la table: Clients")
        aff.printClients(connexion)
        print("\n")
        insertionClient(connexion)
    if(choix == "2"):
        print("Affichage de la table: Animaux")
        aff.printAnimaux(connexion)
        print("\n")
        InsertionAnimal(connexion)
    if(choix == "3"):
        print("Affichage de la table: Animaux")
        aff.printAnimaux(connexion)
        print("\n")
        trait.addTraitement(connexion)

    
    

# menu 3 : Voir le résultat des requetes statistiques
def menu_3(connexion):
    print("\n\n+++++++++++++\n Quelles statistiques voulez vous afficher?")
    print(" 1 : poids et taille moyenne des animaux d'une espèce traitée ")
    print(" 2 : quantité d'un médicament prescrit au total dans la clinique")
    print(" 3 : quantité de chaque type de médicament prescrit pour un animal donné")
    print(" 4 : Statistique bonus: Nombre de vétérinaires consultés par chaque client")
    print("0 pour quitter\n+++++++++++++")
    choix = False
    while not choix:
        choix = input("Entrer le nombre correspondant au choix : ")
        if( choix != "0" and choix != "1" and choix != "2" and choix != "3" and choix != "4"):
            choix = False
            
    if(choix == "1"):
        aff.printStatMoyennesEspeces(connexion)
    if(choix == "2"):
        aff.printStatGlobalesMedoc(connexion)
    if(choix == "3"):
        aff.printStatQteMedocParAnimal(connexion)
    if(choix == "4"):
        aff.printStatBonus(connexion)
        

    
        
if __name__ == "__main__":
    conn = psy.connect("dbname = 'dbbdd0p050' user='bdd0p050' host='tuxa.sme.utc' password='oN37PaLy'")
    while True :
        c = menu_p(conn)
        print("Vous avez selectionne le choix " + c + "\n")
        if(c == "0"):
            break
        menu_s(conn,c)
        conn.commit()
    print("+++++++++++++\nFermeture de la clinique\n+++++++++++++")
    
