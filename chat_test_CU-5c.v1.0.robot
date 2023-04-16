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
    [Template]    Entrer dans le chat [modification d'adresse IP][modification de port]
    127.0.0.1    12345


Entrer dans le chat [connexion impossible]
    [Template]    Entrer dans le chat [connexion impossible]
    127.0.0.1    1883
