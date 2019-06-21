#!/usr/bin/python3
import psycopg2 as psy
import affichage_tables as aff


#menu principal
def menu_p(connexion) :
    print("Bienvenue dans le menu")
    print("Vos choix")
    print(" 1 : Voir le contenu de toutes les tables ")
    print(" 2 : Ajouter des enregistrements dans la base de données")
    print(" 3 : Voir le résultat des requetes statistiques")
    print(" 0 pour quitter")
    choix = 4
    while choix : 
        try :
            choix = input("Entrer le nombre correspondant au choix\n")
            if( choix == "0" or choix == "1" or choix == "2" or choix == "3"):
                break
            int("hello")
        except :
            print("Le choix n'est pas valide, entrer un nombre")
    
    return choix
            
#menu secondaire
def menu_s(connexion, c):
    if(c == "1"):
        menu_1(connexion)
    if(c == "2"):
        menu_2(connexion)
    if(c == "3"):
        menu_3(connexion)

def menu_1(connexion):
    print("Quelle table voulez vous voir?")
    print("Tables disponibles:")
    print("1 : Clients")
    print("2 : Especes Animales")
    print("3 : Animaux")
    print("4 : Medicaments prescrits")
    print("0 pour quitter")
    choix = 1
    while choix:
        try:
            choix = input("Entrer le nombre correspondant au choix\n")
            if( choix == "0" or choix == "1" or choix == "2" or choix == "3" or choix == "4"):
                break
            int("hello")
        except :
            print("Le choix n'est pas valide, entrer un nombre")
            
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

def menu_3(connexion):
    print("A quelles statistiques voulez vous afficher?")
    print(" 1 : poids et taille moyenne des animaux d'une espèce traitée ")
    print(" 2 : quantité d'un médicament prescrit au total dans la clinique")
    print(" 3 : quantité de chaque type de médicament prescrit pour un animal donné")
    print(" 4 : Statistique bonus: Nombre de vétérinaires consultés par chaque client")
    print("0 pour quitter")
    choix = 1
    while choix:
        try:
            choix = input("Entrer le nombre correspondant au choix\n")
            if( choix == "0" or choix == "1" or choix == "2" or choix == "3" or choix == "4"):
                break
            int("hello")
        except :
            print("Le choix n'est pas valide, entrer un nombre")
            
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
    while 1 :
        c = menu_p(conn)
        print("Vous avez selectionne le choix " + c)
        if(c == "0"):
            break
        menu_s(conn,c)
    print("termine")
    
