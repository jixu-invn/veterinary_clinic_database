from datetime import datetime

def creationVetoJSON() :
    nom = str(input("Nom du vétérinaire : "))
    prenom = str(input("Prenom du vétérinaire : "))
    return({"nom":nom, "prenom":prenom})
            
def creationMedicamentJSON() :
    molecule = str(input("Nom du médicament : "))
    while True :
        try :
            conditionnement = int(input("Conditionnement du médicament : "))
            break
        except :
            print("Le conditionnement doit être un entier!")
    return({"molecule" : molecule, "conditionnement" : conditionnement})


def creerDate() :
    while  True :
        try : 
            dateInput = str(input("Date (YYYY-MM-DD) : "))
            date = datetime.strptime(dateInput, '%Y-%m-%d')
            break
        except :
            print("Entrez une date correcte, sous le format indiqué")
        
    date = date.date().strftime('%Y-%m-%d')
    
    return date
        
    

def creationTraitementJSON() :
    print("Entrez une date de debut de traitement. ", end=""); dateDebut = creerDate()
    print("Entrez une date de fin de traitement. ", end=""); dateFin = creerDate()
    while datetime.strptime(dateFin, '%Y-%m-%d') < datetime.strptime(dateDebut, '%Y-%m-%d') :
        print("La date de fin doit être plus ancienne que la date de début")
        dateFin = creerDate()
        
    veto = creationVetoJSON()
    
    while True :
        try : 
            nbMedicaments = int(input("Combien de médicaments sont inclus dans le traitement? : "))
            break
        except :
            print("Entrez un nombre entier")
    listeMedocs = []
    for i in range(0, nbMedicaments, 1) :
        medicament = creationMedicamentJSON()
        listeMedocs.append(medicament)
    
    traitement = {"debut" : dateDebut,
                  "fin" : dateFin,
                  "veto" : veto,
                  "medicaments" : listeMedocs}
    
    return(traitement)
                  
    
    
if __name__ == "__main__" :
    pass
    #print(creerDate())
    #print(creationVetoJSON())
    #print(creationMedicamentJSON())
    #print(creationTraitementJSON())
