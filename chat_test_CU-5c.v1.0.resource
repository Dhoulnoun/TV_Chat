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
    Felix affiche un message de connexion    127.0.0.1    12345
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
    [Arguments]    ${ip}    ${port}
    #1:
    L'utilisateur lance l'éxecution du composant Felix
    #2:
    Felix affiche la vue connexion
    #3:
    L'utilisateur change l'adresse IP    ${ip}
    #4:
    L'utilisateur change le port    ${port}
    #5:
    L'utilisateur demande à se connecter
    #6:
    Felix affiche un message de connexion    ${ip}    ${port}
    #8:
    Felix ferme la vue connexion
    #9:
    Felix affiche la vue chat
    #10:
    Felix affiche un message d'accueil dans le chat

Entrer dans le chat [connexion impossible]
    [Arguments]    ${ip}    ${port}
    #1:
    L'utilisateur lance l'éxecution du composant Felix
    #2:
    Felix affiche la vue connexion
    #3:
    L'utilisateur change l'adresse IP    ${ip}
    #4:
    L'utilisateur change le port    ${port}
    #3:
    L'utilisateur demande à se connecter
    #4:
    Felix affiche un message d'erreur de connexion    ${ip}    ${port}
