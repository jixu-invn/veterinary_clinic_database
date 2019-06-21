import psycopg2
import json
from creationTraitementDict import creationTraitementJSON

def addTraitement(conection) :
    while True :
        try :
            idAnimal = input("Id de l'animal : ")
            idAnimal = int(idAnimal)
            break
        except :
            Print("Entrez un nombre entier!")
            
    sql = "SELECT COALESCE(a.traitement, 0) FROM Animaux a WHERE a.id = %d;" % (idAnimal)
    conection.execute(sql)
    a = conection.fetchone()
    
    if a[0] == "0" :
        traitement = creationTraitementJSON()
        attrTraitement = json.dumps(traitement)
    else :
        attrTraitement = json.loads(a)
        attrTraitement.append(creationTraitementJSON())
        attrTraitement = json.dumps(attrTraitement)
    
    sqlUpdate = "UPDATE Animaux SET traitement = %s WHERE id = %d;" % (attrTraitement, idAnimal)
    connection.execute(sqlUpdate)
    
if __name__ == "__main__" :
    pass
