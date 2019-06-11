SELECT DISTINCT a.id, a.nom, t->'veto'->>'nom' nom_veto,t->'veto'->>'pnom'prénom_veto
FROM animaux a, JSON_ARRAY_ELEMENTS(a.traitements) t;


SELECT DISTINCT a.id, a.nom as animal_medoc_riboflux
FROM animaux a, JSON_ARRAY_ELEMENTS(a.traitements) t
where t->'medicament'->>'molecule'='riboflux';