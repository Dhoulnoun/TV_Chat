# TODO Test cases

*** Settings ***
Library    Process
Library    RemoteSwingLibrary

*** Variables ***

*** Keywords ***

Exécution Camix
    Start Process    java   -Duser.language\=fr    -Duser.country\=FR   -jar    SUT/Camix-0.4.3.jar    alias=Camix
    Sleep    2s

Arrêt Camix
    Terminate Process    Camix
    Sleep    2s

Arrêt Felix
    Switch To Application    Felix
    sleep    2s
    System Exit

L'utilisateur lance l'éxecution du composant Felix
    Start Application    Felix    java -Duser.language=fr -Duser.country=FR -jar SUT/Felix-0.4.3.jar
    ...                     stdout=/dev/null    stderr=/dev/null
    Sleep    2s

Felix affiche la vue connexion
    Window Should Be Open   Connexion

L'utilisateur change l'adresse IP
    [Arguments]    ${ip}
    Select Window    Connexion
	Click On Component    IP
	Sleep    1s
    Focus To Component    IP
	Insert Into Text Field    IP    ${ip}
    Send Keyboard Event    VK_ENTER
	Sleep    1s

L'utilisateur change le port
    [Arguments]    ${port}
    Select Window    Connexion
    sleep    2s
    Focus To Component    Port
    Insert Into Text Field    Port    ${port}
    Send Keyboard Event    VK_ENTER
    sleep    2s


L'utilisateur demande à se connecter
    Select Window    Connexion
    Push Button    Connexion
    sleep    2s

Felix affiche un message de connexion
    [Arguments]    ${ip}    ${port}
    ${informations} =    Get Text Field Value    Information
    Should Be equal as strings  ${informations}     Connexion au chat @${ip}:${port}
    sleep    2s

Felix affiche un message d'erreur de connexion
    [Arguments]    ${ip}    ${port}
    sleep    6s
    ${informations} =    Get Text Field Value    Information
    Should Be equal as strings  ${informations}     Connexion au chat @${ip}:${port} impossible

Felix ferme la vue connexion
    Window Should Not Be Open    Connexion
    Sleep    1s

Felix affiche la vue chat
    Window Should Be Open   Chat
    Sleep    2s

Felix affiche un message d'accueil dans le chat
    Select Window   Chat
    ${message} =    Get Text Field Value    Messages
    Should start with    ${message}    * Taper /h pour avoir de l'aide sur les commandes du chat.
    sleep    2s




