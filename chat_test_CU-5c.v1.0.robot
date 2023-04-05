# TODO test cases

*** Settings ***
Resource    chat_test_CU-5c.v1.0.resource
Resource    resources/java/chat_test_CU-5c.v1.0.resource


Suite Setup    Exécution Camix
Suite Teardown     Arrêt Camix

Test Teardown    Arrêt Felix
*** Variables ***

*** Test Cases ***

Entrer dans le chat
    Entrer dans le chat

Entrer dans le chat [modification d'adresse IP][modification de port]
    Entrer dans le chat [modification d'adresse IP][modification de port]

Entrer dans le chat [connexion impossible]
    Entrer dans le chat [connexion impossible]

Sortir du chat
    Sortir du chat