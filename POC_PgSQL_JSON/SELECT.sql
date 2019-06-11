SELECT a.id, a.nom, t->'veto'->>'nom' nom_veto,t->'veto'->>'pnom' prénom_veto, COUNT(*) nb_traitements_prescrits
FROM animaux a, JSON_ARRAY_ELEMENTS(a.traitements) t
GROUP BY a.id, a.nom, t->'veto'->>'nom',t->'veto'->>'pnom';

-- SELECT supplémentaire: chaque animal ayant eu au moins une prescriptions de riboflux et le nombre de prescriptions reçues de ce médicament
SELECT a.id, a.nom as animal_medoc_riboflux, COUNT(*) as nb_prescriptions
FROM animaux a, JSON_ARRAY_ELEMENTS(a.traitements) t, JSON_ARRAY_ELEMENTS(t->'medicaments') m 
WHERE LOWER(m->>'molecule')='riboflux'
GROUP BY a.id, a.nom;