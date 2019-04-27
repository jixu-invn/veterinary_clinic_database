CREATE VIEW Statistiques_animaux AS(
    SELECT P.nom espece, AVG(P.dernier_poids) PoidsMoyen,AVG(P.derniere_taille) TailleMoyenne
        FROM (SELECT E.nom, A.dernier_poids, A.derniere_taille 
                FROM Especes E, Animaux A 
                WHERE A.espece=E.nom) P 
        GROUP BY P.nom);
-- Poids et taille moyenne des animaux d'une espèce
SELECT * FROM Statistiques_animaux S WHERE S.espece = 'chien'; --on récupère ici les statistiques pour UNE espèce donnée



CREATE VIEW Statistiques_globales_medicaments AS
    SELECT U.medicament, SUM((fin-debut+1)*quantite_journaliere) Quantite_totale_prescrite 
        FROM (SELECT * 
                FROM Traitements T, Traitement_contient C, Medicaments M
                WHERE T.id=C.traitement 
                    AND M.molecule=C.medicament) U
        GROUP BY U.medicament;
-- Quantité totale prescrite d'un médicament donné        
SELECT * FROM Statistiques_globales_medicaments S WHERE S.medicament = 'rinoxolone'; --on récupère ici les statistiques pour UNE molécule donnée

-- Quantité totale prescrite de chaque médicament pour un animal donné
SELECT U.molecule, SUM((U.fin-U.debut+1)*U.quantite_journaliere) Quantite_totale_prescrite 
    FROM (SELECT debut,fin,quantite_journaliere, T.id Traitement, M.molecule, A.id Animal
            FROM Traitements T, Animaux A, Traitement_contient C, Medicaments M
            WHERE T.animal=A.id 
                AND T.id=C.traitement 
                AND M.molecule=C.medicament
                AND A.id = 2) U -- On choisit l'animal
GROUP BY U.molecule;

-----REQUETES BONUS----
-- Nombre d'animaux traités par chaque médecin --
SELECT V.nom, V.prenom, V.naissance, COUNT(DISTINCT T.animal) AS Nb_animaux_traites
    FROM Veterinaires V JOIN Traitements T ON V.id=T.veto
    GROUP BY V.nom, V.prenom, V.naissance;
    
-- Nombre de vétérinaires chez lesquels un client a déjà consulté
SELECT C.nom, C.prenom, C.naissance, COUNT(DISTINCT T.veto) AS Nb_veto_consultes
    FROM (Traitements T JOIN Animaux A ON T.animal=A.id) JOIN Clients C ON A.proprietaire = C.id
    GROUP BY C.nom, C.prenom, C.naissance;
    
