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
    L'utilisateur change l'adresse IP
    #4:
    L'utilisateur change le port
    #5:
    L'utilisateur demande à se connecter
    #6:
    Felix affiche un message de connexion
    #8:
    Felix ferme la vue connexion
    #9:
    Felix affiche la vue chat
    #10:
    Felix affiche un message d'accueil dans le chat

Entrer dans le chat [connexion impossible]
    #1:
    L'utilisateur lance l'éxecution du composant Felix
    #2:
    Felix affiche la vue connexion
    #3:
    L'utilisateur demande à se connecter
    #4:
    Felix affiche un message d'erreur de connexion
    #5:
    Felix ferme la vue connexion

Sortir du chat
    #1:
    L'utilisateur arrête l'éxecution du composant Felix
    #4
    Chaque composant Felix concerné affiche un message de départ de l'utilisateur du chat
