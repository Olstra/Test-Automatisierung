*** Settings ***
Library     SeleniumLibrary
Library     DateTime

*** Variables ***
${Browser}      Chrome
${Delay}        30s

# Login-SSA variables
${Username}     oli+13@sobr.ch
${Password}     1aA@0000
${Anmelden}     xpath=/html/body/div[1]/div/div/div/section/div/div/div/div[2]/div[1]/div/form/section[3]/div[1]

# Geplantes Audit variables
${GeplantesA}   class=icon-clock
${CLButton}     xpath=//*[@id="selectChecklistSuvaPopup"]/div/div/div[2]/div/div[1]/div/div[2]/table/tbody/tr[2]/td[1]/div/span[1]/button

${Hinzufügen}   xpath=//div[contains(text(),'Hinzufügen')]
${Speichern}    class=save-text

# Angaben für die Kontrolle
${LetzteAe}     xpath=//*[@id="content"]/div/div/div[2]/div/div[1]/div/div[2]/table/tbody/tr[1]/td[2]/div/div/div/span/span[1]/span
${ZuletztBeV}   xpath=//*[@id="content"]/div/div/div[2]/div/div[1]/div/div[2]/table/tbody/tr[1]/td[3]/div/div/div/span/span[1]/span
${Status}       xpath=//*[@id="content"]/div/div/div[2]/div/div[1]/div/div[2]/table/tbody/tr[1]/td[6]/div/div/div


# für die Kontrolle - Datum+Uhrzeit benutzen
*** Test Cases ***
Man kann ein neues GEPLANTES AUDIT erzeugen
    Login-SSA

    # wait until loading spinner isn't visible anymore (otherwise click on spinner bg)
    Wait For Loading Spinner

    Click Element   ${GeplantesA}

    # neues Audit erfassen
    Wait Until Element Is Visible   ${Hinzufügen}   ${Delay}
    Click Element   ${Hinzufügen}

    Wait Until Element Is Visible   ${CLButton}      ${Delay}
    Click Element   ${CLButton}


    Wait Until Element Is Visible       ${Speichern}
    Wait Until Element Is Not Visible   class=loader-bg     ${Delay}

    Click Element   ${Speichern}

    # check values of new entry
    ${Date}=   Get Current Date    result_format=%d.%m.%Y
    Element Text Should Be    ${LetzteAe}       ${Date}
    Element Text Should Be    ${ZuletztBeV}     Tester Robot
    Element Text Should Be    ${Status}         Offen


*** Keywords ***
Login-SSA
    Open Browser	https://ssa-test.scapp.io	${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible               ${Anmelden}
    Input Text      id=login-email              ${Username}
    Input Text      name=Passwort               ${Password}
    Click Element                               ${Anmelden}

Wait For Loading Spinner
    Sleep   10s
    Wait Until Element Is Not Visible   class=loader-bg     ${Delay}
    Wait Until Element Is Visible       ${GeplantesA}    ${Delay}