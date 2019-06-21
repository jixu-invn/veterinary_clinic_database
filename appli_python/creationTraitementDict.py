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



def creationTraitementJSON() :
    dateDebut = str(input("Date de début de traitement (YYYY-MM-DD) : "))
    dateFin = str(input("Date de fin de traitement (YYYY-MM-DD) : "))
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
    print(creationTraitementJSON())
    #print(creationVetoJSON())
    #print(creationMedicamentJSON())
