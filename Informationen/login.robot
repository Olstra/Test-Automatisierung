# this is a basic Login testcase for SUVA SSA

*** Settings ***
Library  SeleniumLibrary

# TODO ->Datum für Kurzbeschreibung benutzen

*** Variables ***
${Browser}      Chrome
${Username}     admin
${Password}     nimda
${Anmelden}     xpath=/html/body/div[1]/div/div/div/section/div/div/div/div[2]/div[1]/div/form/section[3]/div[1]

*** Test Cases ***
Login Funktion für SSA
    Login-SSA

*** Keywords ***
Login-SSA
    Open Browser	https://ssa-test.scapp.io	${Browser}
    Wait Until Element Is Visible               ${Anmelden}
    Input Text      id=login-email              ${Username}
    Input Text      name=Passwort               ${Password}
    Click Element                               ${Anmelden}