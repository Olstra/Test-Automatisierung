*** Settings ***
Library     SeleniumLibrary
Library     DateTime

# TODO ->Genaueres Datum (Minuten)?

*** Variables ***
${Browser}      Chrome
${Delay}        30s

# Login-SSA variables
${Username}     oli+13@sobr.ch
${Password}     1aA@0000
${Anmelden}     xpath=/html/body/div[1]/div/div/div/section/div/div/div/div[2]/div[1]/div/form/section[3]/div[1]

# Informationen variables
${Informationen}    class=icon-information-unread
${Hinzufügen}   xpath=//div[contains(text(),'Hinzufügen')]
${Text}         xpath=//body/div[@id='smartadmin-root']/div[1]/div[4]/div[1]/div[1]/div[2]/div[2]/section[1]/div[1]/div[1]/div[1]/fieldset[3]/section[3]/label[1]/span[1]
${Titel}        xpath=//body/div[@id='smartadmin-root']/div[1]/div[4]/div[1]/div[1]/div[2]/div[2]/section[1]/div[1]/div[1]/div[1]/fieldset[3]/section[2]/label[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]
${Speichern}    class=save-text
${TxtInput}     xpath=//*[@id="jarvis-edit-container"]/div/div/fieldset[3]/section[3]/label
${Anhaenge}     xpath=//span[contains(text(),'Anhänge')]

# für die Kontrolle - Datum+Uhrzeit benutzen
${NewDAte}      xpath=//*[@id="content"]/div/div/div[2]/div/div[1]/div/div[2]/table/tbody/tr[1]/td[4]/div/div/div/span/span[1]/span[1]
${Min}          23:59

*** Test Cases ***
Man kann eine neue Information erzeugen
    Login-SSA

    # wait until loading spinner isn't visible anymore (otherwise click on spinner bg)
    Sleep   10s
    Wait Until Element Is Not Visible   class=loader-bg     ${Delay}
    Wait Until Element Is Visible       ${Informationen}    ${Delay}

    Click Element   ${Informationen}

    # neue Info erfassen
    Wait Until Element Is Visible   ${Hinzufügen}   ${Delay}
    Click Element   ${Hinzufügen}

    # Wait Until Element Is Visible   ${Speichern}      ${Delay}
    Click Element   ${Speichern}

    ${Date}=   Get Current Date    result_format=%d.%m.%Y, ${Min}

    # get value check
    Element Text Should Be    //*[@id="content"]/div/div/div[2]/div/div[1]/div/div[2]/table/tbody/tr[1]/td[4]/div/div/div/span/span[1]/span[2]   ${Date}


    # Text in info hinzufügen TODO
#    Scroll Element Into View    ${Anhaenge}
#    Wait Until Element Is Visible    ${Text}
#    Click Element   ${TxtInput}
#    Input Text   ${Titel}  Test-Oliver

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