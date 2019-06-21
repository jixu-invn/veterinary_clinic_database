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
            
    sql = "SELECT a.traitement FROM Animaux a WHERE a.id = %d;" % (idAnimal)
    a = connection.execute(sql)
    
    attrTraitement = json.loads(a)
    attrTraitement.append(creationTraitementJSON())
    attrTraitement = json.dumps(attrTraitement)
    
    sqlUpdate = "UPDATE Animaux SET traitement = %s WHERE id = %d;" % (attrTraitement, idAnimal)
    connection.execute(sqlUpdate)
    
if __name__ == "__main__" :
    pass
