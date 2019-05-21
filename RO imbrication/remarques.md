Remarques à propos du POC ROv1
===

* Dans le prochain livrable, on pourra pousser plus loin l'imbrication en utilisant
l'identification qui nous évitera d'utiliser des clés étrangères.

* On a crée une redondance/source d'incohérence sur les classes/espèces qui évitent de devoir faire deux jointures afin
de récupérer la classe à laquelle appartient un animal.

* __On considère plusieurs médicaments par traitement et une
quantité par jour différente pour chaque médicament.__

* Notons qu'il ne sera pas possible de contraindre les types créés. On ne pourra donc pas implémenter les contraintes NOT NULL ni le fait qu'un traitement doit contenir AU MOINS un médicament.

* On remarque également que cette conception laisse la possibilité d'avoir plusieurs fois le même médicament dans un traitement.

* On réalise tous ces sacrifices afin d'avoir le moins de jointures à faire lorsqu'on interrogera la BDD.
