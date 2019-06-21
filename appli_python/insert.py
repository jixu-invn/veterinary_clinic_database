def insert_animal(connexion):
    print('C\'est pour inserer un animal.\n')
    id = input('Id: ')

    while not id.isdigit():
        id = input('Input invalide, veuillez entrer de nouveau: \n')

    nom = input('Nom d\'animal (s\'il est vide, veuillez entrer): \n')

    der_poids = input("Son dernier poids: ")
    while (der_poids != '' and float(der_poids) < 0):
        der_poids = input("Le poids ne doit pas etre negative, veillez entrer de nouveau: \n")

    der_taille = input("Son dernier taille: ")
    while (der_taille != '' and float(der_taille) < 0):
        der_taille = input("La taille ne doit pas etre negative, veillez entrer de nouveau: \n")

    annee = input("Son annee de naissance: ")
    while (annee != '' and ((int(annee) < 1800) or (int(annee) > 2019))):
        annee = input("L\'annee de naissance est invalide, veuillez entrer de nouveau:\n")

    traitement = input("Son traitement: \n")

    propri = input("Id du proprietaire: ")
    while not propri.isdigit():
        propri = input('Input invalide, veuillez entrer de nouveau: \n')

    espece = input("Son espece: ")

    sql = "INSERT INTO Animaux VALUES("
    sql = sql + id + nom + der_poids + der_taille + annee + traitement + propri + espece + ')'
    resultat = connexion.cursor()
    resultat.execute(sql)


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
    resultat = connexion.cursor()
    resultat.execute(sql)
