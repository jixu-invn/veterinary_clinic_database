Remarques à propos du POC ROv2
===

* Les créations et les insertions sont un peu plus lourdes mais cela simplifiera grandement

* Remarquons que notre conception nous fait perdre les contraintes d'un part sur les tables de références imbriquées.
* D'autre part, on perd les contraintes sur les références elles-mêmes : SCOPE, UNIQUE, NOT NULL, etc.
* Nous aurions souhaité imbriquer les traitements mais sachant que les traitements contiennent la liste des références vers les médicaments nous n'avons pas trouvé comment implémenter une nested table dans une nested table.
