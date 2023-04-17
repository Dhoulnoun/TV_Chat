morix = camix
monix = felix
En tant que "client" je souhaiterais que vous développiez, et validiez 
par test logiciel, les fonctionnalités suivantes sur le logiciel de chat
(composants Camix et Felix).


# I) Fenêtre de connexion
_______________________


Une fenêtre de connexion doit être ajoutée au composant Felix.

Au lancement du composant Felix, une fenêtre de connexion doit
s'afficher.
Cette fenêtre doit être munie :
- d'un champ "IP" éditable, accompagné du label "IP", initialisé avec
l'adresse IP mentionnée dans le fichier de configuration de Felix ;
- d'un champ "Port" éditable, accompagné du label "Port", initialisé
avec le port de connexion mentionné dans le fichier de configuration de
Felix ;
- d'un bouton de connexion, avec le label "Connexion" ;
- d'un champ d'information non éditable, mentionnant "Saisir l'adresse
et le port du serveur chat." à l'initialisation.

L'utilisateur doit pouvoir changer l'adresse IP et le port de connexion.

Lorsque l'utilisateur clique sur le bouton de connexion :
1) Le champ d'information mentionne "Connexion au chat @ADRESSE:PORT" 
(ou ADRESSE et PORT sont respectivement l'adresse et le port mentionnés
dans les champs de saisie) et
2) Felix se connecte au serveur chat à l'adresse et au port mentionnés.

Si la connexion est établie, la fenêtre de connexion se ferme et la
fenêtre de chat actuellement disponible s'ouvre pour permettre de
communiquer avec d'autres clients du chat.
Sinon, la fenêtre de connexion reste ouverte et le champ d'information
mentionne "Connexion au chat @ADRESSE:PORT impossible.", l'utilisateur
peut alors changer l'adresse IP et le port de connexion pour tenter une
nouvelle connexion au chat.

# Specs
## Entrer dans le chat
1. L’utilisateur lance l’exécution du composant Felix
2. Felix affiche la connexion
3. L'utilisateur demande à se connecter <br>
[Variante modif IP] 3.1 L'utilisateur modifie l'IP -> 3.2 Va en 3 <br>
[Variante modif Port] 3.1 L'utilisateur modifie le port -> 3.2 Va en 3
4. Felix affiche un message de connexion
5. Felix affiche la connexion
6. L'utilisateur demande à se connecter.<br>
[Variante connexion impossible] 6.1 Felix affiche un message de connexion impossible -> Fin
7. Felix affiche un message de connexion
8. Felix initie la connexion à Camix.
9. Camix inscrit l’utilisateur dans le canal par défaut
10. Felix ferme la vue connexion 
11. Felix affiche la vue chat
12. =7.

### Scénario nominal
1. L’utilisateur lance l’exécution du composant Felix
2. Felix affiche la connexion
3. L'utilisateur demande à se connecter 
4. Felix affiche un message de connexion
5. Felix initie la connexion à Camix.
6. Camix inscrit l’utilisateur dans le canal par défaut (place publique)
7. Camix informe les composants Felix des autres utilisateurs inscrits dans le canal par défaut que l'utilisateur arrive dans le chat
8. Chaque composant Felix concerné affiche un message d’arrivée de l'utilisateur dans le chat
9. Camix transmet au composant Felix de l'utilisateur un message d'accueil dans le chat
10. Felix ferme la vue connexion 
11. Felix affiche la vue chat
12. Felix affiche un message d'accueil dans le chat

### Variante \[modification de l'adresse IP]\[Modification de port]
1. L’utilisateur lance l’exécution du composant Felix
2. Felix affiche la connexion
3. L'utilisateur modifie l'IP
4. L'utilisateur modifie le port
5. L'utilisateur demande à se connecter
6. Felix affiche un message de connexion
7. Felix initie la connexion à Camix.
8. Camix inscrit l’utilisateur dans le canal par défaut (place publique)
9. Camix informe les composants Felix des autres utilisateurs inscrits dans le canal par défaut que l'utilisateur arrive dans le chat
10. Chaque composant Felix concerné affiche un message d’arrivée de l'utilisateur dans le chat
11. Camix transmet au composant Felix de l'utilisateur un message d'accueil dans le chat 
12. Felix ferme la vue connexion 
13. Felix affiche la vue chat 
14. Felix affiche un message d'accueil dans le chat

### Variante \[Connexion impossible]
1. L’utilisateur lance l’exécution du composant Felix
2. Felix affiche la connexion
3. L'utilisateur modifie l'IP
4. L'utilisateur modifie le port
5. L'utilisateur demande à se connecter
6. Felix affiche un message de connexion
7. Felix affiche un message de connexion impossible
