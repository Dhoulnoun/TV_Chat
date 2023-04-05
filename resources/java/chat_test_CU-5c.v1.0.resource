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
    log    TODO

L'utilisateur change l'adresse IP
    [Arguments]    ${ip}
    Select Window    VueConnexion
	Click On Component    IdentifiantIp
	Sleep    1s
	Insert Into Text Field    IdentifiantIp    ${ip}
	Sleep    1s

L'utilisateur change le port
    [Arguments]    ${port}
    Select Window    VueConnexion
	Click On Component    IdentifiantPort
	Sleep    1s
	Insert Into Text Field    IdentifiantPort    ${port}
	Sleep    1s


L'utilisateur demande à se connecter
    log    TODO

Felix affiche un message de connexion
    log    TODO

Felix affiche un message d'erreur de connexion
    log    TODO

Felix ferme la vue connexion
    log    TODO

Felix affiche la vue chat
    log    TODO

Felix affiche un message d'accueil dans le chat
    log    TODO