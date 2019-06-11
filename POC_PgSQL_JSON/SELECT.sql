SELECT a.id, a.nom, t->'veto'->>'nom' nom_veto,t->'veto'->>'pnom' prénom_veto, COUNT(*) nb_traitements_prescrits
FROM animaux a, JSON_ARRAY_ELEMENTS(a.traitements) t
GROUP BY a.id, a.nom, t->'veto'->>'nom',t->'veto'->>'pnom';