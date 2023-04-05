# TODO Test cases

*** Settings ***
Library    Process
Library    RemoteSwingLibrary

*** Variables ***

*** Keywords ***

Exécution Camix
    Start Process    java   -Duser.language\=fr  -Duser.country\=FR   -jar SUT/Camix-0.4.3.jar  alias=Camix
    Sleep    2s

Arrêt Camix
    Terminate Process    Camix
    Sleep    2s

Arrêt Felix
    Switch To Application    Felix
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
    Push Button   Connecter
    Sleep    5s

Felix affiche un message de connexion
    Select window   Connexion
    ${informations} =    Get Text Field Value    Information
    should be equal as strings

Felix affiche un message d'erreur de connexion
    log    TODO

Felix ferme la vue connexion
    log    TODO

Felix affiche la vue chat
    Select Window   Chat
    Window Should Be Open Chat
    Sleep 2s

Felix affiche un message d'accueil dans le chat

    log    TODO