*** Settings ***
Library     SeleniumLibrary

# TODO ->Datum für Kurzbeschreibung benutzen

*** Variables ***
${Browser}      Chrome
${Delay}        30s

# Login-SSA variables
${Username}     admin
${Password}     nimda
${Anmelden}     xpath=/html/body/div[1]/div/div/div/section/div/div/div/div[2]/div[1]/div/form/section[3]/div[1]

# Informationen variables
${Informationen}    class=icon-information-unread
${Hinzufügen}       xpath=//div[contains(text(),'Hinzufügen')]
${Titel}     xpath=//body/div[@id='smartadmin-root']/div[1]/div[4]/div[1]/div[1]/div[2]/div[2]/section[1]/div[1]/div[1]/div[1]/fieldset[3]/section[2]/label[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]
${Speichern}        class=save-text


*** Test Cases ***
Man kann eine neue Information erzeugen
    Login-SSA

    # wait until loading spinner isn't visible anymore (otherwise click on spinner bg)
    Wait Until Element Is Visible       ${Informationen}    ${Delay}
    Wait Until Element Is Not Visible   class=loader-bg     ${Delay}
    Wait Until Element Is Visible       ${Informationen}    ${Delay}
    Wait Until Element Is Not Visible   class=loader-bg     ${Delay}

    Click Element   ${Informationen}

    # neue Info erfassen
    Wait Until Element Is Visible   ${Hinzufügen}   ${Delay}
    Click Element   ${Hinzufügen}

    Scroll Element Into View    ${Titel}
    Wait Until Element Is Visible    ${Titel}
    Input Text  ${Titel}   Test-Oliver

   # Wait Until Element Is Visible   ${Speichern}      ${Delay}
    #Click Element   ${Speichern}

*** Keywords ***

Login-SSA
    Open Browser	https://ssa-test.scapp.io	${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible               ${Anmelden}
    Input Text      id=login-email              ${Username}
    Input Text      name=Passwort               ${Password}
    Click Element                               ${Anmelden}

Click Minify
    Click Element  xpath=/html/body/div[1]/div/aside/nav/div[1]