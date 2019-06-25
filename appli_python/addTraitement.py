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
            print("Entrez un nombre entier!")
            
    cur = conection.cursor()
    sql = "SELECT a.traitements FROM Animaux a WHERE a.id = %d;" % (idAnimal)
    cur.execute(sql)
    a = cur.fetchone()
    
    if a[0] == None :
        traitement = creationTraitementJSON()
        attrTraitement = json.dumps(traitement)
    else :
        attrTraitement = json.loads(json.dumps(a[0]))
        attrTraitement.append(json.loads(json.dumps(creationTraitementJSON())))
        attrTraitement = json.dumps(attrTraitement)
    
    sqlUpdate = "UPDATE Animaux SET traitements = '%s' WHERE id = %d;" % (attrTraitement, idAnimal)
    cur.execute(sqlUpdate)
    
if __name__ == "__main__" :
    pass
