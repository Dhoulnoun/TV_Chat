# TODO test cases

*** Settings ***
Resource    chat_test_CU-5c.v1.0.resource
Resource    resources/java/chat_test_CU-5c.v1.0.resource


Suite Setup    Exécution Camix
Suite Teardown     Arrêt Camix

Test Teardown    Arrêt Felix
*** Variables ***
${ip1}    127.0.0.1
${port1}    12345
${ip2}    127.0.0.2
${port2}    8080
${ip3}    10.0.0.2
${port3}    8888
${ip4}    172.16.0.1
${port4}    80
*** Test Cases ***

Entrer dans le chat
    Entrer dans le chat

Entrer dans le chat [modification d'adresse IP][modification de port]
    [Template]    Entrer dans le chat [modification d'adresse IP][modification de port]
    ${ip1}    ${port1}
    ${ip2}    ${port1}



Entrer dans le chat [connexion impossible]
    [Template]    Entrer dans le chat [connexion impossible]
    ${ip3}    ${port3}
    ${ip4}    ${port4}
