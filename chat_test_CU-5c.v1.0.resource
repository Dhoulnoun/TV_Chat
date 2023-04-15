*** Settings ***
Resource    resources/java/chat_test_CU-5c.v1.0.resource
*** Keywords ***

Entrer dans le chat
    #1:
    L'utilisateur lance l'éxecution du composant Felix
    #2:
    Felix affiche la vue connexion
    #3:
    L'utilisateur demande à se connecter
    #4:
    Felix affiche un message de connexion
    #5: 6: 7: (interne)
    #8: (non appliqué dans ce test - précondition : 0 clients dans la chat)
    #9: (interne)
    #10:
    Felix ferme la vue connexion
    #11:
    Felix affiche la vue chat
    #12
    Felix affiche un message d'accueil dans le chat

Entrer dans le chat [modification d'adresse IP][modification de port]
    #1:
    L'utilisateur lance l'éxecution du composant Felix
    #2:
    Felix affiche la vue connexion
    #3:
    L'utilisateur change l'adresse IP    127.2.0.1
    #4:
    L'utilisateur change le port    12345
    #5:
    L'utilisateur demande à se connecter
    #6:
    Felix affiche un message de connexion    127.0.0.1    12345
    #8:
    Felix ferme la vue connexion
    #9:
    Felix affiche la vue chat
    #10:
    Felix affiche un message d'accueil dans le chat

Entrer dans le chat [connexion impossible]
 #1.
    L’utilisateur lance l’exécution du composant Felix
    #2.
    Felix affiche la connexion
    #3.a
    L'utilisateur modifie l'IP    123.456.789.123
    #3.b
    L'utilisateur modifie le port    24680
    #3.
    L'utilisateur demande à se connecter
    #4.
    Felix affiche un message de connexion    123.456.789.123    24680
    #5. internes
    #6.a
    Felix affiche un message de connexion impossible    123.456.789.123    24680
