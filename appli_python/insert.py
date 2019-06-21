def insert_animal():
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

    espace = input("Son espece: ")








insert_animal()
